<%@ Page Title="" Language="C#" EnableViewState="true"  MasterPageFile="MainUser.Master" AutoEventWireup="true" CodeBehind="DashboardI.aspx.cs" Inherits="Allotment.DashboardI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


    <script type="text/javascript" src="/js/loader.js"></script>
    <script type="text/javascript" src="/js/highcharts.js"></script>
<script type="text/javascript" src="/js/data.js"></script>
<script type="text/javascript" src="/js/drilldown.js"></script>
    <script src="https://cdn.amcharts.com/lib/4/core.js"></script>
<script src="https://cdn.amcharts.com/lib/4/charts.js"></script>
<script src="https://cdn.amcharts.com/lib/4/themes/animated.js"></script>

    <style>
#chartdiv {
  width: 100%;
  height: 500px;
}
</style>
    <style>
        #main-menu li i {
            color:#fff;
        }
        .dashboardi-a .list-group {
            margin-bottom:0;
        }
    </style>
     <script>
         am4core.ready(function () {

             // Themes begin
             am4core.useTheme(am4themes_animated);
             // Themes end

             // Create chart instance
             var chart = am4core.create("chartdiv", am4charts.XYChart3D);

             // Add data
             chart.data = [{
                 "country": "Total Recieved",
                 "visits": 4025
             }, {
                 "country": "Pending",
                 "visits": 1882
             }, {
                 "country": "Under Objection",
                 "visits": 1809
             }, {
                 "country": "Approved",
                     "visits": 1322
                 }, {
                     "country": "Rejected",
                     "visits": 1009
           
             }];

             // Create axes
             let categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
             categoryAxis.dataFields.category = "country";
             categoryAxis.renderer.labels.template.rotation = 270;
             categoryAxis.renderer.labels.template.hideOversized = false;
             categoryAxis.renderer.minGridDistance = 20;
             categoryAxis.renderer.labels.template.horizontalCenter = "right";
             categoryAxis.renderer.labels.template.verticalCenter = "middle";
             categoryAxis.tooltip.label.rotation = 270;
             categoryAxis.tooltip.label.horizontalCenter = "right";
             categoryAxis.tooltip.label.verticalCenter = "middle";

             let valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
             valueAxis.title.text = "No of Applications";
             valueAxis.title.fontWeight = "bold";

             // Create series
             var series = chart.series.push(new am4charts.ColumnSeries3D());
             series.dataFields.valueY = "visits";
             series.dataFields.categoryX = "country";
             series.name = "Visits";
             series.tooltipText = "{categoryX}: [bold]{valueY}[/]";
             series.columns.template.fillOpacity = .8;

             var columnTemplate = series.columns.template;
             columnTemplate.strokeWidth = 2;
             columnTemplate.strokeOpacity = 1;
             columnTemplate.stroke = am4core.color("#FFFFFF");

             columnTemplate.adapter.add("fill", function (fill, target) {
                 return chart.colors.getIndex(target.dataItem.index);
             })

             columnTemplate.adapter.add("stroke", function (stroke, target) {
                 return chart.colors.getIndex(target.dataItem.index);
             })

             chart.cursor = new am4charts.XYCursor();
             chart.cursor.lineX.strokeOpacity = 0;
             chart.cursor.lineY.strokeOpacity = 0;

         }); // end am4core.ready()
     </script>

    <script>
        am4core.ready(function () {

            // Themes begin
            am4core.useTheme(am4themes_animated);
            // Themes end

            // Create chart instance
            var chart = am4core.create("chartdiv1", am4charts.PieChart);

            // Add data
            chart.data = [{
                "country": "Total Received",
                "litres": 501.9
            }, {
                "country": "Pending",
                "litres": 301.9
            }, {
                "country": "Approved",
                "litres": 201.1
            }, {
                "country": "Rejected",
                "litres": 165.8
            }, {
                "country": "Under Objection",
                "litres": 139.9
           
            }];

            // Add and configure Series
            var pieSeries = chart.series.push(new am4charts.PieSeries());
            pieSeries.dataFields.value = "litres";
            pieSeries.dataFields.category = "country";
            pieSeries.innerRadius = am4core.percent(50);
            pieSeries.ticks.template.disabled = true;
            pieSeries.labels.template.disabled = true;

            var rgm = new am4core.RadialGradientModifier();
            rgm.brightnesses.push(-0.8, -0.8, -0.5, 0, - 0.5);
            pieSeries.slices.template.fillModifier = rgm;
            pieSeries.slices.template.strokeModifier = rgm;
            pieSeries.slices.template.strokeOpacity = 0.4;
            pieSeries.slices.template.strokeWidth = 0;

            chart.legend = new am4charts.Legend();
            chart.legend.position = "right";

        }); // end am4core.ready()
    </script>
            
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

    

<asp:UpdatePanel ID="upCrudGrid" runat="server" UpdateMode="Always"  >
   <ContentTemplate>
 
 




     <div id="wrapper">
        <!-- Navigation -->
        <div id="page-wrapper">
            <div class="row">
                <div class="col-md-12 col-sm-12 col-xs-12">
                    <h1 class="page-header">Dashboard</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3 col-sm-6 col-xs-12" style="margin-bottom:10px;">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <i class="fa fa-user fa-4x"></i>
                                </div>
                                <div class="col-sm-9 col-sm-9 text-right col-xs-9">
                                    <div class="font-bold">Personal Info</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel panel-default">
                        <div class="panel-heading">
                            Personal Info                       
                        </div>
                        <div class="panel-body dashboardi-a">
                            <div class="list-group">
                                <a class="list-group-item" href="#">Name                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblName" runat="server" Text=""></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Designation.                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lbldesignation" runat="server" Text=""></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Grade.                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblGrade" runat="server" Text=""></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Phone No.                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblPhoneNo" runat="server" Text=""></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Email                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></em>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                 </div>
              </div>
                <div class="col-md-3 col-sm-6 col-xs-12" style="margin-bottom:10px;">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <i class="fa fa-tasks fa-4x"></i>
                                </div>
                                <div class="col-md-9 col-sm-9 text-right col-xs-9">
                                    <div class="font-bold">Allotments</div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel panel-default">
                        <div class="panel-heading">
                            Registrations                       
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body dashboardi-a">
                            <div class="list-group">
                                <a class="list-group-item" href="#">New Allotment Requests                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblnew" runat="server" ></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Pending/In Process                                  
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblnewsigPending" runat="server" ></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Under Objection                              
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblNewSignActivated" runat="server"></asp:Label></em>
                                    </span>
                                </a>
                                
                                 <a class="list-group-item" href="#">Rejected                               
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblnewsignRejected" runat="server"></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Completed                              
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblnewsignCompleted" runat="server"></asp:Label></em>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12" style="margin-bottom:10px;">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <i class="fa fa-tasks fa-4x"></i>
                                </div>
                                <div class="col-md-9 col-sm-9 text-right col-xs-9">
                                    <div class="font-bold">Allottee Registrations</div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left">View Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           Registration/Migration                       
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body dashboardi-a">
                            <div class="list-group">
                               
                                <a class="list-group-item" href="#">Allottee Request                                  
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="LblAllotteeRequest" runat="server" ></asp:Label></em>
                                    </span>
                                </a>

                                <a class="list-group-item" href="#">Allottee Request Not in Considration                                
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="LblAllotteeReqNotInCon" runat="server"></asp:Label></em>
                                    </span>
                                </a>

                                 <a class="list-group-item" href="#">Allottee Request Accepted                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="LblReqAccepted" runat="server" ></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Pending                              
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="LblAllotteeReqPending" runat="server"></asp:Label></em>
                                    </span>
                                </a>
                                
                         
                                <a class="list-group-item" href="#">Completed                              
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="LblAllotteeReqCompleted" runat="server"></asp:Label></em>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 col-xs-12" style="margin-bottom:10px;">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-md-3 col-sm-3 col-xs-3">
                                    <i class="fa fa-suitcase fa-4x" aria-hidden="true"></i>
                                </div>
                                <div class="col-md-9 col-sm-9 text-right col-xs-9">
                                    <div class="font-bold">Service Request</div>
                                </div>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <span class="pull-left">Details</span>
                            <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                            <div class="clearfix"></div>
                        </div>
                        <div class="panel panel-default">
                        <div class="panel-heading">
                           Service Requests                     
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body dashboardi-a">
                            <div class="list-group">
                                  <a class="list-group-item" href="#">New Requests                                   
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblserreqnew" runat="server"></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Pending                                 
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblserpend" runat="server"></asp:Label></em>
                                    </span>
                                </a>

                                <a class="list-group-item" href="#">In Process                               
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblserProcessed" runat="server"></asp:Label></em>
                                    </span>
                                </a>
                                
                                 <a class="list-group-item" href="#">Rejected                               
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblserrej" runat="server" ></asp:Label></em>
                                    </span>
                                </a>
                                <a class="list-group-item" href="#">Completed                              
                                    <span class="pull-right text-muted small"><em>
                                        <asp:Label ID="lblserComp" runat="server" ></asp:Label></em>
                                    </span>
                                </a>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
</div>
            <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="panel panel-default">


                
                <div class="clearfix"></div>
                <div class="row" style="border:1px solid #ccc;margin:10px 0;">
                    <div class="panel-heading font-bold">Status of Land Allotment Through Nivesh Mitra</div>
                    <div class="pie-chart col-md-12 col-sm-12 col-xs-12" style="margin-top:5px;">
                        <div id="chartdiv" style="height:400px"></div>
                        
                    </div>
                </div><br />


       
                <div class="clearfix"></div>
               
                <div class="row" style="border:1px solid #ccc;margin:15px 0;">
                     <div class="panel-heading font-bold">Status of Land Allotment Through Nivesh Mitra</div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        
                       
                         <div id="chartdiv1" style="height:300px"></div>
                    </div>
                </div>
                </div>

    </div>
        </div>   <div class="clearfix"></div>
            
            </div>

        </div>
                 

</ContentTemplate>
    </asp:UpdatePanel>

      


    <script type="text/javascript">
        $(function () {
            $('.collapse').on('shown.bs.collapse', function () {
                $(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
            }).on('hidden.bs.collapse', function () {
                $(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
            });
        })</script>
</asp:Content>
