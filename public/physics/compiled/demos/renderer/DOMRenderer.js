// Generated by CoffeeScript 1.4.0
/* DOM Renderer
*/

var DOMRenderer,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

DOMRenderer = (function(_super) {

  __extends(DOMRenderer, _super);

  function DOMRenderer() {
    this.setSize = __bind(this.setSize, this);
    DOMRenderer.__super__.constructor.apply(this, arguments);
    this.useGPU = true;
    this.domElement = document.createElement('div');
  }

  DOMRenderer.prototype.init = function(physics) {
    var el, p, st, _i, _len, _ref, _results;
    DOMRenderer.__super__.init.call(this, physics);
    _ref = physics.particles;
    _results = [];
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      p = _ref[_i];
      el = document.createElement('span');
      el.className = 'fuck';
      st = el.style;
      st.position = 'absolute';
      st.height = 150;
      st.width = 400;
      this.domElement.appendChild(el);
      _results.push(p.domElement = el);
    }
    return _results;
  };

  DOMRenderer.prototype.render = function(physics) {
    var p, time, _i, _len, _ref;
    DOMRenderer.__super__.render.call(this, physics);
    time = new Date().getTime();
    if (this.renderParticles) {
      _ref = physics.particles;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        p = _ref[_i];
        if (this.useGPU) {
          p.domElement.style.WebkitTransform = "matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, " + (p.pos.x | 0) + ", " + (p.pos.y | 0) + ", 0, 1)";
        } else {
          p.domElement.style.left = p.pos.x;
          p.domElement.style.top = p.pos.y;
        }
      }
    }
    return this.renderTime = new Date().getTime() - time;
  };

  DOMRenderer.prototype.setSize = function(width, height) {
    this.width = width;
    this.height = height;
    return DOMRenderer.__super__.setSize.call(this, this.width, this.height);
  };

  DOMRenderer.prototype.destroy = function() {
    var _results;
    _results = [];
    while (this.domElement.hasChildNodes()) {
      _results.push(this.domElement.removeChild(this.domElement.lastChild));
    }
    return _results;
  };

  return DOMRenderer;

})(Renderer);
