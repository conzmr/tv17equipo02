$(function () {

    $.getJSON('https://www.highcharts.com/samples/data/jsonp.php?filename=world-population.json&callback=?', function (data) {

        // Correct UK to GB in data
        $.each(data, function () {
            if (this.code === 'UK') {
                this.code = 'GB';
            }
        });

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
                data: data,
                minSize: 4,
                maxSize: '8%',
                tooltip: {
                    pointFormat: '{point.code}: {point.z} thousands'
                }
            }]
        });

    });
});
