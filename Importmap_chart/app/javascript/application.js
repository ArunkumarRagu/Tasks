// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import Highcharts from 'highcharts';
console.log("hiiii");

document.addEventListener('DOMContentLoaded', function() {
    const lineChartData = [10, 15, 8, 25, 18];
  
    Highcharts.chart('line-chart', {
      series: [{
        type: 'line',
        data: lineChartData,
      }],
      title: {
        text: 'Line Chart Example',
      },
    });

    Highcharts.chart('pie-chart', {
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false,
            type: 'pie'
        },
        title: {
            text: 'Browser market shares in May, 2020',
            align: 'left'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
            point: {
                valueSuffix: '%'
            }
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            name: 'Brands',
            colorByPoint: true,
            data: [{
                name: 'Chrome',
                y: 70.67,
                sliced: true,
                selected: true
            }, {
                name: 'Edge',
                y: 14.77
            },  {
                name: 'Firefox',
                y: 4.86
            }, {
                name: 'Safari',
                y: 2.63
            }, {
                name: 'Internet Explorer',
                y: 1.53
            },  {
                name: 'Opera',
                y: 1.40
            }, {
                name: 'Sogou Explorer',
                y: 0.84
            }, {
                name: 'QQ',
                y: 0.51
            }, {
                name: 'Other',
                y: 2.6
            }]
        }]
        });

    Highcharts.chart('stacked-column', {

            chart: {
                type: 'column'
            },
        
            title: {
                text: 'Olympic Games all-time medal table, grouped by continent',
                align: 'left'
            },
        
            xAxis: {
                categories: ['Gold', 'Silver', 'Bronze']
            },
        
            yAxis: {
                allowDecimals: false,
                min: 0,
                title: {
                    text: 'Count medals'
                }
            },
        
            tooltip: {
                format: '<b>{key}</b><br/>{series.name}: {y}<br/>' +
                    'Total: {point.stackTotal}'
            },
        
            plotOptions: {
                column: {
                    stacking: 'normal'
                }
            },
        
            series: [{
                name: 'Norway',
                data: [148, 133, 124],
                stack: 'Europe'
            }, {
                name: 'Germany',
                data: [102, 98, 65],
                stack: 'Europe'
            }, {
                name: 'United States',
                data: [113, 122, 95],
                stack: 'North America'
            }, {
                name: 'Canada',
                data: [77, 72, 80],
                stack: 'North America'
            }]
        });    
});



Highcharts.chart('multi-axes', {
    chart: {
        zoomType: 'xy'
    },
    title: {
        text: 'Average Monthly Weather Data for Tokyo',
        align: 'left'
    },
    subtitle: {
        text: 'Source: WorldClimate.com',
        align: 'left'
    },
    xAxis: [{
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
            'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        crosshair: true
    }],
    yAxis: [{ // Primary yAxis
        labels: {
            format: '{value}°C',
            style: {
                color: Highcharts.getOptions().colors[2]
            }
        },
        title: {
            text: 'Temperature',
            style: {
                color: Highcharts.getOptions().colors[2]
            }
        },
        opposite: true

    }, { // Secondary yAxis
        gridLineWidth: 0,
        title: {
            text: 'Rainfall',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        },
        labels: {
            format: '{value} mm',
            style: {
                color: Highcharts.getOptions().colors[0]
            }
        }

    }, { // Tertiary yAxis
        gridLineWidth: 0,
        title: {
            text: 'Sea-Level Pressure',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        },
        labels: {
            format: '{value} mb',
            style: {
                color: Highcharts.getOptions().colors[1]
            }
        },
        opposite: true
    }],
    tooltip: {
        shared: true
    },
    legend: {
        layout: 'vertical',
        align: 'left',
        x: 80,
        verticalAlign: 'top',
        y: 55,
        floating: true,
        backgroundColor:
            Highcharts.defaultOptions.legend.backgroundColor || // theme
            'rgba(255,255,255,0.25)'
    },
    series: [{
        name: 'Rainfall',
        type: 'column',
        yAxis: 1,
        data: [49.9, 71.5, 106.4, 129.2, 144.0, 176.0, 135.6, 148.5, 216.4, 194.1, 95.6, 54.4],
        tooltip: {
            valueSuffix: ' mm'
        }

    }, {
        name: 'Sea-Level Pressure',
        type: 'spline',
        yAxis: 2,
        data: [1016, 1016, 1015.9, 1015.5, 1012.3, 1009.5, 1009.6, 1010.2, 1013.1, 1016.9, 1018.2, 1016.7],
        marker: {
            enabled: false
        },
        dashStyle: 'shortdot',
        tooltip: {
            valueSuffix: ' mb'
        }

    }, {
        name: 'Temperature',
        type: 'spline',
        data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
        tooltip: {
            valueSuffix: ' °C'
        }
    }],
    responsive: {
        rules: [{
            condition: {
                maxWidth: 500
            },
            chartOptions: {
                legend: {
                    floating: false,
                    layout: 'horizontal',
                    align: 'center',
                    verticalAlign: 'bottom',
                    x: 0,
                    y: 0
                },
                yAxis: [{
                    labels: {
                        align: 'right',
                        x: 0,
                        y: -6
                    },
                    showLastLabel: false
                }, {
                    labels: {
                        align: 'left',
                        x: 0,
                        y: -6
                    },
                    showLastLabel: false
                }, {
                    visible: false
                }]
            }
        }]
    }
});


