// Int -> String
var centToDollar = function(x) {
    var cents;
    cents = (x%10 === 0) ? "0" :  "";
    cents = (x%100 === 0) ? ".00" : cents;
    return "$" + (x/100) + cents;
}

// String -> Int
var dollarToCent = function(x) {
    console.log(x);
    //Remove commas and $ sign
    x = x.replace(/,/g,'').substring(1);
    console.log(x);
    return Math.round(parseFloat(x) * 100);
}

// Any Number of Strings -> String
var addDollar = function() {
    var args = arguments;
    var total = 0;
    for(var i = 0, l = args.length; i < l; i++) {
        total = total + dollarToCent(args[i]);
    }

    return centToDollar(total);
}

// Any Number of Strings -> String
var subtractDollar = function() {
    var args = arguments;
    var total = dollarToCent(args[0]);
    for(var i = 1, l = args.length; i < l; i++) {
        total = total - dollarToCent(args[i]);
    }

    return centToDollar(total);
}
