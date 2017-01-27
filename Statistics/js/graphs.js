var array = [{code:"MX", z:0},{code:"US", z:0},{code:"CA", z:0}];
var arrGender= [{gender:"male", c:0},{gender:"female", c:0}];

(function(){
  var config = {
    apiKey: "AIzaSyCGtYN3lyGjmAOwTdFujyLouz0Cunlb4s4",
    authDomain: "puertadehierro-a797c.firebaseapp.com",
    databaseURL: "https://puertadehierro-a797c.firebaseio.com",
    storageBucket: "puertadehierro-a797c.appspot.com",
    messagingSenderId: "442464985582"
  };

  firebase.initializeApp(config);

  var ref = firebase.database().ref();
  var myArray;


    var refUsers = ref.child('users');



    var refOn = refUsers.on('child_added', function(snap){
      if(snap.val().country == "Mexico"){
        array[0].z++;
      }
      else if (snap.val().country == "USA"){
        array[1].z++;
      }
      else{
        array[2].z++;
      }

      if(snap.val().gender=="M"){ //SEXO
        arrGender[0].c++;			//SEXO
      }else if(snap.val().gender=="F"){ //SEXO
        arrGender[1].c++; 			//SEXO
      }
    });

}());

var loadMap = function () {
        Highcharts.mapChart('container', {
        	colors: ['#86B4F0'],
            chart: {
                borderWidth: 0,
                map: 'custom/world',
                backgroundColor: 'transparent',
                 spacingBottom: 15,
        spacingTop: 0,
        spacingLeft: 10,
        spacingRight: 10
            },


            title: {
                text: ''
            },

            legend: {
                enabled: false
            },

            mapNavigation: {
                enabled: false
            },

            credits: {
              enabled: false
            },

            plotOptions: {
            series: {
                cursor: 'pointer',
            }
        },

            series: [{
                name: 'Countries',
                color: '#FF0000',
                nullColor: '#727177',
                enableMouseTracking: true,
            }, {
                type: 'mapbubble',
                name: 'Population 2013',
                joinBy: ['iso-a2', 'code'],
                data: array,
                minSize: 4,
                maxSize: '8%',
                tooltip: {
                    pointFormat: '{point.code}: {point.z} thousands'
                }
            }]
        });

var data = [

  {
    value: arrGender[0].c,
    color: "#ACACAC"

},{
    value: arrGender[1].c,
    color: "#9467FD"
}];


Chart.defaults.global.responsive = true;
var ctx = document.getElementById("donut-chart").getContext("2d");
new Chart(ctx).Pie(data, {
labels : ["January","February"],
    segmentShowStroke: false,
    percentageInnerCutout: 50,
    animationSteps: 50,
    animationEasing: "linear",
    animateRotate: true,
});

}; //checkkk

//Chart-blur

var chartData = [{
   "year": "2000",
       "cars": 1691,
       "motorcycles": 737

}, {
   "year": "2001",
       "cars": 1098,
       "motorcycles": 680,
       "bicycles": 910
}, {
   "year": "2002",
       "cars": 975,
       "motorcycles": 664,
       "bicycles": 670
}, {
   "year": "2003",
       "cars": 1246,
       "motorcycles": 648,
       "bicycles": 930
}, {
   "year": "2004",
       "cars": 1218,
       "motorcycles": 637,
       "bicycles": 1010
}, {
   "year": "2005",
       "cars": 1913,
       "motorcycles": 133,
       "bicycles": 1770
}, {
   "year": "2006",
       "cars": 1299,
       "motorcycles": 621,
       "bicycles": 820
}, {
   "year": "2007",
       "cars": 1110,
       "motorcycles": 10,
       "bicycles": 1050
}, {
   "year": "2008",
       "cars": 765,
       "motorcycles": 232,
       "bicycles": 650
}, {
   "year": "2009",
       "cars": 1145,
       "motorcycles": 219,
       "bicycles": 780
}, {
   "year": "2010",
       "cars": 1163,
       "motorcycles": 201,
       "bicycles": 700
}, {
   "year": "2011",
       "cars": 1780,
       "motorcycles": 85,
       "bicycles": 1470
}, {
   "year": "2012",
       "cars": 1580,
       "motorcycles": 285
}];

var chart =  AmCharts.makeChart("chartdiv", {
    "type": "serial",
"theme": "light",

    "fontFamily": "Lato",
    "autoMargins": true,
    "addClassNames": true,
    "zoomOutText": "",
    "defs": {
        "filter": [
            {
                "x": "-50%",
                "y": "-50%",
                "width": "200%",
                "height": "200%",
                "id": "blur",
                "feGaussianBlur": {
                    "in": "SourceGraphic",
                    "stdDeviation": "50"
                }
            },
            {
                "id": "shadow",
                "width": "150%",
                "height": "150%",
                "feOffset": {
                    "result": "offOut",
                    "in": "SourceAlpha",
                    "dx": "2",
                    "dy": "2"
                },
                "feGaussianBlur": {
                    "result": "blurOut",
                    "in": "offOut",
                    "stdDeviation": "10"
                },
                "feColorMatrix": {
                    "result": "blurOut",
                    "type": "matrix",
                    "values": "0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 .2 0"
                },
                "feBlend": {
                    "in": "SourceGraphic",
                    "in2": "blurOut",
                    "mode": "normal"
                }
            }
        ]
    },
    "fontSize": 15,
    "pathToImages": "../amcharts/images/",
    "dataProvider": chartData,
    "dataDateFormat": "YYYY",
    "marginTop": 0,
    "marginRight": 1,
    "marginLeft": 0,
    "autoMarginOffset": 5,
    "categoryField": "year",
    "categoryAxis": {
        "gridAlpha": 0.07,
        "axisColor": "#DADADA",
        "startOnAxis": true,
        "tickLength": 0,
        "parseDates": true,
        "minPeriod": "YYYY"
    },
    "valueAxes": [
        {
            "ignoreAxisWidth":true,
            "stackType": "regular",
            "gridAlpha": 0.07,
            "axisAlpha": 0,
            "inside": true
        }
    ],
    "graphs": [
        {
            "id": "g1",
            "type": "line",
            "title": "Cars",
            "valueField": "cars",
            "fillColors": [
                "#0066e3",
                "#802ea9"
            ],
            "lineAlpha": 0,
            "fillAlphas": 0.8,
            "showBalloon": false
        },
        {
            "id": "g2",
            "type": "line",
            "title": "Motorcycles",
            "valueField": "motorcycles",
            "lineAlpha": 0,
            "fillAlphas": 0.8,
            "lineColor": "#5bb5ea",
            "showBalloon": false
        },
        {
            "id": "g3",
            "title": "Bicycles",
            "valueField": "bicycles",
            "lineAlpha": 0.5,
            "lineColor": "#FFFFFF",
            "bullet": "round",
            "dashLength": 2,
            "bulletBorderAlpha": 1,
            "bulletAlpha": 1,
            "bulletSize": 15,
            "stackable": false,
            "bulletColor": "#5d7ad9",
            "bulletBorderColor": "#FFFFFF",
            "bulletBorderThickness": 3,
            "balloonText": "<div style='margin-bottom:30px;text-shadow: 2px 2px rgba(0, 0, 0, 0.1); font-weight:200;font-size:30px; color:#ffffff'>[[value]]</div>"
        }
    ],
    "chartCursor": {
        "cursorAlpha": 1,
        "zoomable": false,
        "cursorColor": "#FFFFFF",
        "categoryBalloonColor": "#8d83c8",
        "fullWidth": true,
        "categoryBalloonDateFormat": "YYYY",
        "balloonPointerOrientation": "vertical"
    },
    "balloon": {
        "borderAlpha": 0,
        "fillAlpha": 0,
        "shadowAlpha": 0,
        "offsetX": 40,
        "offsetY": -50
    }
});

// we zoom chart in order to have better blur (form side to side)
chart.addListener("dataUpdated", zoomChart);

function zoomChart(){
    chart.zoomToIndexes(1, chartData.length - 2);
}

AmCharts.makeChart("barchart",
  {
    "type": "serial",
    "categoryField": "category",
    "autoMarginOffset": 40,
    "marginRight": 70,
    "marginTop": 70,
    "startDuration": 1,
    "fontFamily": "",
    "fontSize": 13,
    "handDrawn": false,
    "handDrawScatter": 8,
    "handDrawThickness": 6,
    "theme": "chalk",
    "categoryAxis": {
      "gridPosition": "start",
      "axisColor": "#000000"
    },
    "trendLines": [],
    "graphs": [
      {
        "balloonText": "Number of  [[title]] in [[category]]: [[value]]",
        "fillAlphas": 0.9,
        "id": "AmGraph-1",
        "title": "men",
        "type": "column",
        "valueField": "Men"
      },
      {
        "balloonText": "Number of  [[title]] in [[category]]: [[value]]",
        "fillAlphas": 0.9,
        "id": "AmGraph-2",
        "title": "women",
        "type": "column",
        "valueField": "Women"
      }
    ],
    "guides": [],
    "valueAxes": [
      {
        "id": "ValueAxis-1",
        "title": "Axis title"
      }
    ],
    "allLabels": [],
    "balloon": {},
    "titles": [],
    "dataProvider": [
      {
        "category": "EUA",
        "Men": 1,
        "Women": 3
      },
      {
        "category": "Canadá",
        "Men": 6,
        "Women": 7
      },
      {
        "category": "México",
        "Men": 2,
        "Women": 3
      }
    ]
  }
);

var gaugeChart = AmCharts.makeChart("circ-chart", {
  "type": "gauge",
  "theme": "black",
  "axes": [{
    "axisAlpha": 0,
    "tickAlpha": 0,
    "labelsEnabled": false,
    "startValue": 0,
    "endValue": 100,
    "startAngle": 0,
    "endAngle": 270,
    "bands": [{
      "color": "#eee",
      "startValue": 0,
      "endValue": 100,
      "radius": "100%",
      "innerRadius": "85%"
    }, {
      "color": "#031C7D",
      "startValue": 0,
      "endValue": 80,
      "radius": "100%",
      "innerRadius": "85%",
      "balloonText": "90%"
    }, {
      "color": "#eee",
      "startValue": 0,
      "endValue": 100,
      "radius": "80%",
      "innerRadius": "65%"
    }, {
      "color": "#259EC3",
      "startValue": 0,
      "endValue": 35,
      "radius": "80%",
      "innerRadius": "65%",
      "balloonText": "35%"
    }, {
      "color": "#eee",
      "startValue": 0,
      "endValue": 100,
      "radius": "60%",
      "innerRadius": "45%"
    }, {
      "color": "#157565",
      "startValue": 0,
      "endValue": 92,
      "radius": "60%",
      "innerRadius": "45%",
      "balloonText": "92%"
    }, {
      "color": "#eee",
      "startValue": 0,
      "endValue": 100,
      "radius": "40%",
      "innerRadius": "25%"
    }, {
      "color": "#00CACA",
      "startValue": 0,
      "endValue": 68,
      "radius": "40%",
      "innerRadius": "25%",
      "balloonText": "68%"
    }]
  }],
  "allLabels": [{
    "text": "Less than 18",
    "x": "49%",
    "y": "5%",
    "size": 15,
    "bold": true,
    "color": "#031C7D",
    "align": "right"
  }, {
    "text": "18 to 35",
    "x": "49%",
    "y": "15%",
    "size": 15,
    "bold": true,
    "color": "#259EC3",
    "align": "right"
  }, {
    "text": "36 to 64",
    "x": "49%",
    "y": "24%",
    "size": 15,
    "bold": true,
    "color": "#157565",
    "align": "right"
  }, {
    "text": "65 or more",
    "x": "49%",
    "y": "33%",
    "size": 15,
    "bold": true,
    "color": "#00CACA",
    "align": "right"
  }],
  "export": {
    "enabled": true
  }
});
