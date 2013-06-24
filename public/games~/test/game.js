	window.onload = function(){
		//Create engine with Canvas
		TurbulenzEngine = WebGLTurbulenzEngine.create({
			canvas: document.getElementById("canvas")
		});		
		
		//Low level graphic device interface
		var graphicsDevice = TurbulenzEngine.createGraphicsDevice({});
		var mathDevice = TurbulenzEngine.createMathDevice({});
		var canvasElem = TurbulenzEngine.canvas;
		var canvas = Canvas.create(graphicsDevice, mathDevice);
	
	
		//High level API, sprite creating
        var draw2D = Draw2D.create({
            graphicsDevice: graphicsDevice
        });
		
		//Colours
        var r = 1.0, g = 1.0, b = 1.0, a = 1.0;
        var bgColor = [r, g, b, a];

		//Height/Width
        var x1 = 50;
        var y1 = 50;
        var x2 = graphicsDevice.width - 50;
        var y2 = graphicsDevice.height - 50;

        var rectangle = [x1, y1, x2, y2];

        var drawObject = {
            color: [0.0, 0.0, 0.0, 1.0],
            destinationRectangle: rectangle
        };
		//Create texture for annotations
		var proceduralTextureParameters = {
			name: "annotationLayout",
			width: 2,
			height: 2,
			depth: 1,
			format: graphicsDevice.PIXELFORMAT_L8,
			mipmaps: true,
			cubemap: false,
			renderable: false,
			dynamic: false,
			data: [  255, 200,200, 255,
				   89,   0, 55,   0,
					 0, 11,   0, 2,
				   11,   0, 2,   0]
		};
		//Create texture for annotations
		var overlay = graphicsDevice.createTexture({
			src: "assets/textures/overlay.png",
			mipmaps: true,
			onload: function (texture)
			{
				if (texture)
				{
					sprite.setTexture(texture);
					sprite.setTextureRectangle([0, 0, texture.width, texture.height]);
				}
			}
		});
		var tex = graphicsDevice.createTexture(proceduralTextureParameters);
		
		//Create the sprite
		//graphicsDevice.width graphicDevice.height
        var sprite = Draw2DSprite.create({
			texture: tex,
            width: graphicsDevice.width,
			origin: [0, 0],
            height: 100,
            color: [0.22, 0.9, 0.5, 1.0],
			name: 'Menu'
        });
		
        var backdrop = Draw2DSprite.create({
			texture: overlay,
            width: graphicsDevice.width,
			origin: [0, 0],
            height: graphicsDevice.height,
            color: [1.0, 1.0, 1.0, 1.0],
			name: 'Backdrop'
        });
		
        var collide = Draw2DSprite.create({
			texture: tex,
            width: graphicsDevice.width,
            height: 100,
			width:	100,
			x : 400,
			y: 400,
            color: [0.22, 0.9, 0.5, 1.0],
			name: 'Square'
        });
		
		//Add listener
		//Cache keyCodes
		var inputDevice = WebGLInputDevice.create(canvas);
		var keyCodes = inputDevice.keyCodes;
		var showMenu = true;
		var onKeyTilda = function onKeyTildaFn(keycode)
		{
			//Tilda
			if (keycode === keyCodes.GRAVE)
			{
				console.log("Trigger!");
				showMenu = !showMenu
				
			}
			else if(keycode === keyCodes.LEFT){
			  collide.x -= 5;
			}
			else if(keycode === keyCodes.RIGHT){
			  collide.x += 5;
			}
			else if(keycode === keyCodes.UP){
			  collide.y -= 5;
			}
			else if(keycode === keyCodes.DOWN){
			  collide.y += 5;
			}
			else if(keycode == keyCodes.W){
				var compress = false;
				var width = graphicsDevice.width;
				var height = graphicsDevice.height;

				console.log(canvas);
				var ctx = canvas.getContext("2d");
				console.log(ctx);
				var imageData = ctx.createImageData(width, height);
				var data = imageData.data;
				var pixels = graphicsDevice.getScreenshot(compress);
				if (!pixels)
				{
					alert("Failed to get screenshot.");
					return;
				}

				var srcRowStride = (width * 4);
				var srcRow = ((height - 1) * srcRowStride);
				var desItem = 0;
				for (var y = 0; y < height; y += 1)
				{
					var srcItem = srcRow;
					for (var x = 0; x < width; x += 1)
					{
						data[desItem + 0] = pixels[srcItem + 0];
						data[desItem + 1] = pixels[srcItem + 1];
						data[desItem + 2] = pixels[srcItem + 2];
						data[desItem + 3] = 255;
						srcItem += 4;
						desItem += 4;
					}
					srcRow -= srcRowStride;
				}

				ctx.putImageData(imageData, 0, 0);
			
			
			}
			else{
				console.log(keycode);
			}
		};
		
		var onMouseOver = function onMouseOverFn(x, y)
		{
			console.log("X:" + x + " Y:" + y);
			if (showMenu){
				for (var i = 0; i < draw2d_vertex_list.length; i++) {
					var temp_2d_el_position = draw2d_vertex_list[i].getPosition()
					if (temp_2d_el_position.x1 > x){
						if (document.getElementById(draw2d_vertex_list[i].getUniqueID())){
							document.getElementById("canvas-container").removeChild(document.getElementById(draw2d_vertex_list[i].getUniqueID()));
							continue;
						}
						continue;
					}
					else if(temp_2d_el_position.x2 < x){
						if (document.getElementById(draw2d_vertex_list[i].getUniqueID())){
							document.getElementById("canvas-container").removeChild(document.getElementById(draw2d_vertex_list[i].getUniqueID()));
							continue;
						}
						continue;
					}
					else if(temp_2d_el_position.y1 > y){
						if (document.getElementById(draw2d_vertex_list[i].getUniqueID())){
							document.getElementById("canvas-container").removeChild(document.getElementById(draw2d_vertex_list[i].getUniqueID()));
							continue;
						}
						continue;
					}
					else if(temp_2d_el_position.y3 < y){
						if (document.getElementById(draw2d_vertex_list[i].getUniqueID())){
							document.getElementById("canvas-container").removeChild(document.getElementById(draw2d_vertex_list[i].getUniqueID()));
							continue;
						}
						continue;
					}
					else{
						console.log("collide");
						console.log(draw2d_vertex_list[i].getName());
						if ((!document.getElementById(draw2d_vertex_list[i].getUniqueID())) && (showMenu)){
							var text = draw2d_vertex_list[i].getName();
							var position = draw2d_vertex_list[i].getPosition();
							var annotation = document.createElement('p');
							annotation.id = draw2d_vertex_list[i].getUniqueID();
							annotation.className = 'annotation';
							annotation.innerHTML = text;
							if (position.y1 < 100){
								annotation.style.left = position.x1;
								annotation.style.top =  position.y3 + 0;
								//annotation.style.left = 200;
								//annotation.style.top = 200;
							}
							else{
								annotation.style.left = position.x1;
								annotation.style.top = position.y1-(position.y3-position.y1);
							}
							document.getElementById("canvas-container").appendChild(annotation);
						}
					};
				};
			};
		};

		inputDevice.addEventListener('mouseover', onMouseOver);
		inputDevice.addEventListener('keydown', onKeyTilda);
		
        function update() {
            /* Update code goes here */
            //b += 0.01;
            //bgColor[2] = b % 1; // Clamp color between 0-1

            //sprite.rotation += rotateAngle;
            //sprite.rotation %= PI2; //Wrap rotation at PI * 2
			
			//Check for events
			inputDevice.update();
			
			//Rendering
            if (graphicsDevice.beginFrame())
            {
                graphicsDevice.clear(bgColor, 0.1);
                /* Rendering code goes here */
				
				
				//Begin 2D Objects
                draw2D.begin();
				
				//Objects
                //draw2D.draw(drawObject);
				
				if (showMenu){
					draw2D.drawSprite(sprite);
				}
				draw2D.drawSprite(collide);
				
				
				//End 2D
                draw2D.end();
				
				draw2D.begin('alpha');
				
				draw2D.drawSprite(backdrop);
				
				draw2D.end();
				
				//Transparent layer

                graphicsDevice.endFrame();
            }
        }

        TurbulenzEngine.setInterval(update, 1000 / 60);
	}