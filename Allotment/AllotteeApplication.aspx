<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllotteeApplication.aspx.cs" Inherits="Allotment.AllotteeApplication" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/CssManu.css" rel="stylesheet" />
    <link href="css/Main.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/ajax-jquery-ui.css" rel="stylesheet" />
    <link href="css/Footer.css" rel="stylesheet" />
    <script src="js/ajax-jquery-min.js"></script>
    <script src="js/ajax-jquery-ui.js"></script>
    <script src="assets/js/bootstrap.min.js"></script>
    <script src="/js/jquery1.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="/js/jquery.js"></script>
    <script src="/js/bootstrap.min.js"></script>
    <link href="css/chosen.min.css" rel="stylesheet" />
    <script src="js/chosen.jquery.min.js"></script>
  
    
  
    <style>
        #GridView1 tr th{
            background:#ccc !important;
        }

            @media only screen and (max-width: 768px) {
                .form-group label.text-right {
                    text-align:left !important;
                }
                .form-group .col-sm-6 {
                    width:50% !important;
                }
                .right-niveshban {
                    text-align:center;
                }
                .left-niveshban {
                    text-align:center;
                }
            }
            @media only screen and (min-width: 768px) {
                .right-niveshban {
                    text-align:right;
                }
                .left-niveshban {
                    text-align:left;
                }
            }
            
        .check-cross {
            color: #f70000;
            font-size: 18px;
            line-height: 0.7;
            font-weight: 100;
        }

          .MessagePennel {
            background-color: #f4e542;
            width: 100%;
        }
        .modal-open {
            overflow: auto !important;
        }
        .note-block {
            font-size: 14px;
    border: 1px solid #ccc;
    display: block;
    background: #dcdcdc;
    padding: 12px;
    text-align: justify;
    margin: 5px 0;
        }
  #UpdateProgress1{
               position: fixed;
               width: 100%;
               height: 100%;
               z-index: 99999;
               background: rgba(0,0,0,0.21176470588235294);
           }
           #UpdateProgress1 .fgh{
                position: absolute;
                top: 45%;
                margin: 0px auto;
                left: 45%;
                z-index: 999;
           }

        h4.modal-title {
            margin-right: 18px !important;
        }

        .mynew-panel-head {
            font-size: 14px !important;
            font-weight: 600;
            background: #2d2d2d;
            color: #ffc511 !important;
            text-align: center !important;
        }

        .modal.fade.in {
            background: rgba(0, 0, 0, 0.51);
        }

        @media screen and (min-width: 992px) {
            #myModal .modal-dialog {
                width: 800px;
                /* height: 300px; */
                margin-top: 11%;
            }
        }
        .fill-view-mytable td {
            font-size:16px !important;
        }
        .modal-header {
            padding: 2px !important;
        }
    </style>

    <script>
        function scrollFunction() {

            if (document.getElementById("agreement").scrollTop > 1500) {
                document.getElementById("btnIAccept").style.display = "Revert";
            }
            else {
                document.getElementById("btnIAccept").style.display = "None";
            }
        }

        function ShowTermsAndCondition() {
            $("#btnModalTerms").click();
        }
    </script>

</head>
    <body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       
        <asp:UpdatePanel ID="upCrudGrid" runat="server" UpdateMode="Conditional">
             <Triggers>
            <asp:PostBackTrigger ControlID="btn_backNmswp" />
           
         
        </Triggers>
            <ContentTemplate>
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="upCrudGrid">
                    <ProgressTemplate>
                        <div class="fgh">
                            <div class="hgf text-center">
                              <span style="font-size:25px;font-weight:bold;">Please Wait...</span><br /> <i class="fa fa-spinner fa-spin fa-3x fa-fw"></i>
                                
                            </div>
                        </div>
                    </ProgressTemplate>
                </asp:UpdateProgress>

                <div>
                    <div class="container">

                        <button type="button" id="btnSleepModal" class="ey-bg btn-primary pull-right" data-toggle="modal" data-target="#myModalSleep" data-backdrop="static" style="margin:2px 5px 0 0;display:none;">Heading</button>
                        
     <!-- Modal -->
  <div class="modal fade" id="myModalSleep" role="dialog">
    <div class="modal-dialog">
    <style>
        .mynewpanelhead {
            font-size: 14px !important;
            font-weight: 600;
            background: #2d2d2d;
            color: #ffc511 !important;
        }
        #myModalSleep h4.modal-title {
            margin-right: 18px;
            text-align: center;
        }
        #myModalSleep.modal .modal-body {
            padding: 3px 3px 0 0 !important;
            background: #000;
            color: #10ce10;
            min-height: 100px;
        }
        #myModalSleep{
            background: rgba(0, 0, 0, 0.1);
        }
        .modal-backdrop {
            background:none !important;
        }
        @media only screen and (min-width: 920px) {
           #myModalSleep .modal-dialog{
                top:38%;
                width:900px
            }
        }
    </style>
      <!-- Modal content-->
      <div class="modal-content">
        
        <div class="modal-body" >
            <div style="padding:0 15px;max-height:600px;overflow-y:auto">
              <span class="message">Connecting To Nivesh Mitra</span>
                <asp:HiddenField runat="server" ID="HidFieldSuccessFail" />
               
                <button type="button" id="btnCloseModal" class="ey-bg btn-primary pull-right" data-dismiss="modal"  data-target="#myModalSleep" style="margin:2px 5px 0 0;display:none;">Close</button>
            </div>
        </div>
       
      </div>
      
    </div>
  </div>


                      

                        <div class="modal fade" id="myModal" role="dialog" tabindex="-1">
                            <div class="modal-dialog">
                                <!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        <h4 class="modal-title mynew-panel-head text-center">Terms and Conditions</h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="scr" id="agreement" style="font-size: 12px; padding: 4px 15px; overflow: auto; height: 321px;" onscroll="scrollFunction()">

                                            <table class="table-bordered table table table-hover table-responsive">
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>Scheme is open-ended as long as the Plots are shown available for allotment on website of the Corporation. </td>
                                                </tr>
                                                <tr>

                                                    <td>1.</td>

                                                    <td>Applicants will have to fill up all the entries of the application form available on website of Corporation <a href="http://www.upsidc.com">www.upsidc.com</a> and www.onlineupsidc.com for allotment of industrial plots. Duly filled in and signed application form, complete in all respect, alongwith 2 copies of self attested project report, rough layout Plan and other required documents will have to be submitted in respective office of Regional Manger/Project officer. Incomplete application forms will not be entertained.

                                                    </td>
                                                </tr>
                                                <tr>

                                                    <td>2</td>

                                                    <td>&nbsp;(A) Plots against which 5% earnest money is payable, reservation money @10% of the premium rate of the plot (after adjusting 5% earnest money previously paid) shall be payable within 30 days from the date of allotment, failing which allotment shall stand cancelled and refund, if any, shall be made as per rules of the Corporation. Remaining 90% the premium rate of allotted plot will be payable in 10 half yearly installments (2 years moratorium during which 6 monthly interest shall be payable) with interest @14% P.A. Rebate of 3% in interest will be allowed in case of timely payment.</td>
                                                </tr>
                                                <tr>

                                                    <td></td>

                                                    <td>(B) Plots against which 10% earnest money is payable, reservation money @25% of the premium rate of the plot (after adjusting 10% earnest money previously paid) shall be payable within 30 days from the date of allotment. Remaining 75% the premium rate of allotted plot shall be payable in 12 half yearly installments with interest @14% P.A. Rebate of 2% in interest shall be allowed in case of timely payment.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>3.</td>
                                                    <td>Successful applicants will be selected after examining and evaluating the facts and documents enclosed with the application form by a “Project evaluation committee.” Evaluation shall be based on specified norms by awarding marks on proposed investments in Building, Plant &amp; machinery, direct employment generation, proposed time to make the unit functional (Time extension fee per annum shall be payable as per rules of the Corporation after expiry of such proposed timeline to make unit functional), relevant experience of the applicant, demand of the additional land in the same Industrial Area or for the expansion of existing unit, 100% export oriented units (Certificate from the Directorate of industry and export promotion council necessary) woman, schedule caste/schedule tribes/divyang entrepreneurs (minimum 26% stake in applicant company/ Partnership Firm is must), Networth or turnover of the applicant in previous year.
                  <br />
                                                        <br />
                                                        (i) Applicant will have to submit relevant documents/certificates in support of above mentioned claims.<br />
                                                        (ii) Apart from the other parameters, cognizance of above information shall be taken while examining functionality of project by comparing facts furnished in application form with actuals
                  
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>4.</td>
                                                    <td>Successful applicants will have to make unit functional within the time line mentioned below from the date of allotment –</td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>
                                                        <table  class="table table-bordered request-table table-hover">
                                                            <tr>
                                                                <th>Sl. No.                      </th>
                                                                <th>Proposed investments in the project
                                                                </th>
                                                                <th>Admissible time
                                                                </th>
                                                            </tr>
                                                            <tr>
                                                                <td>1.
                                                                </td>
                                                                <td>Upto Rs. 25 Crores 
                                                                </td>
                                                                <td>2 years
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>2.
                                                                </td>
                                                                <td>Morethan Rs. 25 Crores&nbsp; but less than Rs. 50 Crores
                                                                </td>
                                                                <td>3 years
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>3.
                                                                </td>
                                                                <td>Morethan Rs. 50 Crores&nbsp; but less than Rs. 100 Crores
                                                                </td>
                                                                <td>4 years
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>4.
                                                                </td>
                                                                <td>Morethan Rs. 100 Crores 
                         
                                                                </td>
                                                                <td>5 years
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;</td>
                                                    <td>In case of project under abovesaid category (iii) &amp; (iv)&nbsp; 4 years /5 years time to make unit functional shall be admissible only if the project with such investments has been appraised by an recognized  financial institutions.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>5</td>
                                                    <td>Agro based/food processing unit in Agro Park, Lucknow/Varanasi, apparels related unit in Trans Delhi Signature City (Apparel Zone), Handicraft units in SEZ Moradabad can only be established.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>6.</td>
                                                    <td>Minimum 30% of total production will have to be exported by units to be established in Export oriented Industrial Park (EPIP) Gautam Budh Nagar.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>7.</td>
                                                    <td>Within the time period stipulated in allotment letter, the allottee will have to commence  construction of factory building, complete the same by covering at least 30% of the area of the plot by roof/permanent shed as also install plant and machinery , and start commercial production therein, failing which allotment of plots will be liable to be cancelled with forfeiture of amount paid as per rules of Corporation.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>8.</td>
                                                    <td>The stamp duty, registration charges and legal expenses involved in the execution of Sale Deed, Lease Deed etc. will have to be borne by the allottee.
              
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>9.</td>
                                                    <td>The total balance premium together with the stipulated interest will continue to be first charge on the allotted plot till fully paid.
              
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>10.</td>
                                                    <td>The payments made by the allottee/lessee shall be first adjusted towards the interest due, if any, then towards the premium due and then towards interest on maintenance charges and maintenance charge if any, and balance, if any, towards lease rent/use and occupation charges.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>11.</td>
                                                    <td>The allottee will have to make his own arrangements for discharges of effluents of his unit in accordance with the terms and conditions of the State Effluent Boards, U.P. Pollution Control Board/other Competent authority. The allotment will be liable to be cancelled if the effluent is obnoxious/hazardous to the others in vicinity. The allottee has also to obtain NOC from U.P. Pollution Control Board.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>12.</td>
                                                    <td>In employing labour for the unit, skilled, semi-skilled and unskilled, the allottee shall give preference to one or two able bodied persons from the families whose land has been acquired for the purpose of that Industrial area.
              
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>13.</td>
                                                    <td>&nbsp;The allotment shall be automatically cancelled and deposits forfeited if any misrepresentation is found in the facts stated by entrepreneur in the application form or any time later in any future correspondence with the corporation.
              .
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>14.</td>
                                                    <td>Successful allottees will have to execute lease deed&nbsp; and start construction after getting possession of plot, Building Plan approved by Corporation within prescribed time. In case of default the Corporation will have right to cancel the allotment and forfeit the deposits of the allottee as per rules. The applicant will have to abide by the terms and conditions of the allotment letter and the lease Deed and such other terms as are laid down by the corporation from time to time.
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>15.</td>
                                                    <td>Plots will be allotted at the rate prevailing on the date of issue of allotment letter.</td>
                                                </tr>
                                                <tr>
                                                    <td>16.</td>
                                                    <td>&nbsp;Number of plots and its area may vary. 
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>17.</td>
                                                    <td>&nbsp;In case more applications for allotment of similar size of plots are received than the plots available, allotment of plots of the area varying 20% of applied size may be considered. </td>
                                                </tr>

                                                <tr>
                                                    <td>18.</td>
                                                    <td>&nbsp;If sufficient number of plots are not available for allotment viewing applications received, allotment against such applications may be considered by subdividing/ amalgamating plots available for allotment as per rules and additional cost, if any, will be payable by allottee. If while subdividing bigger size plots, any construction of road/infrastructure is required to be undertaken, the allotment of such subdivided plots may be made after revision of the cost of the plot which will be payable by allottee.


         
                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td>19.</td>
                                                    <td>Applications received will be processed and evaluated every week by a “project evaluation committee” and position of Plots available for allotment shall be updated from time to time. </td>
                                                </tr>

                                                <tr>
                                                    <td>20.</td>
                                                    <td>Transfer of vacant plots will not be allowed. </td>
                                                </tr>

                                                <tr>
                                                    <td>21.</td>
                                                    <td>Plots will be allotted on 90 years lease. Use and occupation charges, lease rent and maintenance charges will be payable as per rules of the Corporation.</td>
                                                </tr>

                                                <tr>
                                                    <td>22.</td>
                                                    <td>Plots will be allotted on “as is where is” basis and leveling etc. if necessary, is to be undertaken by allottee himself at his own expenses. Arrangements for the discharge of industrial effluents have also to be made by the allottees themselves according to the laws in force and rules made there under from time to time.</td>
                                                </tr>

                                                <tr>
                                                    <td>23.</td>
                                                    <td>&nbsp;The Corporation does not normally provide facilities for housing in the Industrial Areas but subject to rules and bye-laws of local bodies, if any, 6% of the total plotted area or 10% of the covered area, whichever is less, in the plot at any time can be used for the residence of essential staff only, subject to the provisions of concerned authority. </td>
                                                </tr>

                                                <tr>
                                                    <td>24.</td>
                                                    <td>Further details may be obtained from the office of concerning Regional Manager/Project Officer.</td>
                                                </tr>

                                                <tr>
                                                    <td>25.</td>
                                                    <td>Corporation reserves right to cancel above allotment scheme at any stage without assigning any reason.</td>
                                                </tr>
                                                 <tr>
                                                    <td>26.</td>
                                                    <td>The timely payment for fee & dues is the responsibility of the applicant. UPSIDA is not responsible for any delay due to reconcilation of payment or any technical error at banks/payment gateway end.</td>
                                                </tr>
                                                <tr>
                                                    <td>27.</td>
                                                    <td>Terms and conditions stipulated above are not exhaustive and are only illustrative and are subject to change at any time without notice.</td>
                                                </tr>


                                            </table>
                                            

                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="modal-footer">
                                    <div class="pull-left">Note : Please scroll down to read & accept all terms & Conditions</div>
                                        <div class="pull-right border-buttons">
                                            <asp:Button ID="btnIAccept" runat="server" OnClick="btnIAccept_Click" CssClass="btn btn-sm btn-primary btn-popup" Style="margin-right: 3px;display:none;" Text="I Accept"/>
                                            <button type="button" id="closeBtn" class="btn btn-primary btn-popup" data-dismiss="modal" style="margin-right: 0;">Cancel</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <input type="button" id="btnModalTerms" style="display: none;" data-toggle="modal" data-target="#myModal" data-backdrop="static" />


                        <%-- End Of Modal Section  --%>

                     <div class="panel panel-default">
                                      <div class="" style="border: 1px solid #cccccc; margin-bottom: 8px; background: #fdfdfd;" runat="server" id="BannerDiv">
                                        <div class="row">
                                            <div class="col-md-3 col-sm-4 col-xs-12 left-niveshban">
                                                <ul class="mylogo-ul list-inline " style="margin: 0; padding: 6px 0 9px 1px;">
                                                    <li>
                                                        <img src="/images/logo-img/govt_up.png" alt="Goverment" /></li>
                                                    <li></li>
                                                </ul>
                                            </div>
                                            <div class="col-md-6 col-sm-4 col-xs-12 text-center">
                                              
                                                <h2 id="chg_head">Nivesh Mitra</h2>
                                                <p><span style="font-size:20px;">Single Window Portal</span> ,Govt. of Uttar Pradesh</p>
                                            </div>
                                            <div class="col-md-3 col-sm-4 col-xs-12 right-niveshban">
                                                <ul class="mylogo-ul list-inline" style="margin: 0; padding: 6px 0 9px 1px;margin-left:170px;">
                                                    <li>
                                                        <img src="/images/logo-img/logo_udhyog_bandu_b.jpg" alt="Goverment" /></li>

                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div> <div class="clearfix"></div>
                                     <div class="" style="border: 1px solid #cccccc; margin-bottom: 8px; background: #fdfdfd;" runat="server" id="Div1">
                                        <div class="row">
                                            <div class="col-md-12 col-sm-12 col-xs-12 text-center">
                                                
                                                     <h3 id="H1">Uttar Pradesh Expressway Industrial Development Authority</h3>
                                                  
                                            </div>
                                           
                                            <div class="clearfix"></div>
                                        </div>
                                    </div> 
                                <div class="clearfix"></div>
                              <div class="panel-heading col-md-12 font-bold" style="font-size: 14px !important; font-weight: 600;"><div  class="col-md-6 col-sm-6 col-xs-6 text-left">उत्तर प्रदेश सरकार &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;GOVERNMENT OF UTTAR PRADESH</div>
                                  <div class="col-md-6 col-sm-6 col-xs-6 text-right">
                      <asp:Button runat="server" ID="btn_backNmswp" Text="⇦ Go Back" CssClass="pull-right btn btn-info" Style="background-color:#02486d;color:#fff;font-weight:600;" OnClick="btn_backNmswp_Click"  />
                    </div></div>
                                    <div class="clearfix"></div>
                        <asp:HiddenField runat="server" ClientIDMode="Static" EnableViewState="true" ID="HidStatus" />

                        <div class="row" id="SideDiv">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="panel panel-default">
                                  
                                    <div class="clearfix"></div>
                                    <div class="panel-heading font-bold text-center" style="font-size: 14px !important; font-weight: 600; background: #2d2d2d; color: #ffc511 !important;"><asp:Label runat="server" ID="PageHeadingLbl"></asp:Label></div></div>
                                    <div class="col-md-12" style="border-left:1px solid #ccc;">

                                                    <div id="divMessageError" class="MessagePennel" runat="server" style="display:none;">
                            <label>
                                <span class="check-cross" runat="server">✖</span>
                                
                                <asp:Label ID="lblMessageError" Text="" runat="server"></asp:Label>
                            </label>
                        </div> 

                                    <asp:MultiView runat="server" ID="Allotment">

                                        <asp:View runat="server" ID="View1">
                                            
                                            <div style="margin: 14px 0 10px 0; background: #f5f5f5; padding: 10px; border: 1px solid #c1c1c1; font-size: 15px;">
                                                <span class="" style="font-size: 15px; font-weight: 600; margin-bottom: 7px; display: block;">Dear Investor,</span>We have received the following information from Nivesh Mitra for your application for <asp:Label runat="server" ID="lblServiceName"></asp:Label>.<br />
                                            </div>

                                            <div style="background: #ececec; margin-top: 0px; padding: 10px 0;">
                                                <div class="form-group">
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Control ID :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblControlId" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6  text-right">
                                                        Unit ID :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblUnitId" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Company Name :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblCompanyName" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr class="myhrline" />
                                                <div class="form-group">
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Industry District :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblIndustryDistrict" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Industry Address :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblIndustryAddress" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Industry Pincode :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblIndustryPincode" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>

                                                </div>
                                                <div class="clearfix"></div>
                                                <hr class="myhrline" />
                                                <div class="form-group">
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Occupier Name :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblOccupierName" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Occupier Email :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblOccupierEmail" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Occupier Phone :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblOccupierPhone" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr class="myhrline" />
                                                <div class="form-group">
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Occupier PAN :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblOccupierPAN" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Occupier Address :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblOccupierAddress" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Occupier District Name :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblOccupierDistrictName" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr class="myhrline" />
                                                <div class="form-group">
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Nature of Activity :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblNatureofActivity" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Installed Capacity :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblInstalledCapacity" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        No of Employees :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblNoOfEmployee" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr class="myhrline" />
                                                <div class="form-group">
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Nature of Operation :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblNature_of_Operation" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Project Cost :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblProject_Cost" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Organization Type :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblOrganization_Type" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr class="myhrline" />
                                                <div class="form-group">
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Industry Type Name :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblIndustry_Type_Name" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Items Manufactured :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblItems_Manufactured" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                    <div class="hidden-lg hidden-md"><div class="clearfix"></div></div>
                                                    <label class="col-md-2 col-sm-6 col-xs-6 text-right">
                                                        Annual Turnover :
                                                    </label>
                                                    <div class="col-md-2 col-sm-6 col-xs-6">
                                                        <asp:Label ID="lblAnnual_Turnover" runat="server" CssClass="font-bold"></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="clearfix"></div>
                                                <hr class="myhrline" />
                                            </div>
                                            <div class="form-group" style="margin-top: 15px;">
                                                 <div class="col-md-12 col-sm-12 col-xs-12 text-center" runat="server" id="btnDiv">
                                                        <span class="text-center" runat="server" id="Span1">
                                                            <a href="#" runat="server" id="proceedAnchor" class="btn btn-default" style="padding: 3px 6px;" onserverclick="proceedAnchor_ServerClick" >Please Proceed For filling other details <i class="fa fa-long-arrow-right" aria-hidden="true" ></i></a></span>
                                         
                                                    </div>
                                                 <div class="col-md-12 col-sm-12 col-xs-12 text-center" runat="server" id="btnDiv1" visible="false">
                                                        <span class="text-center" runat="server" id="Span2">
                                                            <a href="#" data-toggle="modal" data-target="#myModal" data-backdrop="static" class="btn btn-default" style="padding: 3px 6px;">Please Proceed For filling other details <i class="fa fa-long-arrow-right" aria-hidden="true"></i></a></span>
                                                 </div>
                                         
                                                </form>
                                        </asp:View>


                                        <asp:View ID="View2" runat="server">
                                        </asp:View>

                                        <asp:View ID="View3" runat="server">
                                            <div style="margin: 14px 0 10px 0; background: #f5f5f5; padding: 10px; border: 1px solid #c1c1c1; font-size: 15px;">
                                                <span class="text-center" style="font-size: 15px; font-weight: 600; margin-bottom: 2px; display: block;">Please suggest your plot requirements  or prefrences of your choice from available plots.<br />
                                            </div>
                                            <div class="">
                                            <div style="border: 1px solid #ccc; margin: 0 0 6px 0; background: #ececec;" class="col-md-9 col-sm-6 col-xs-12">
                                                <div class="row">
                                                    <div class="form-group" style="padding: 0px 0 2px 0; background: #d9d9d9;">                                                    
                                                        <div class="col-md-12 col-sm-6 col-xs-6 font-bold">
                                                            <span style="font-size: 15px;">Select Node</span> &nbsp;&nbsp; <asp:DropDownList ID="ddl_Node" AutoPostBack="true" Width="78%" runat="server" CssClass="chosen margin-left-z input-sm similar-select1" style="background: #fff;" OnSelectedIndexChanged="ddl_Node_SelectedIndexChanged"></asp:DropDownList>
                                                        </div>
                                                         

                                                        <div class="clearfix"></div>
                                                        <hr class="myhrline" />
                                                    </div>
                                                    <style>
                                                        .myul-tabs a:after{
                                                            display:none;

                                                        }
                                                        .myul-tabs {
                                                            margin-left: 0 !important;
                                                            padding-left: 0;
                                                            margin-top:5px;
                                                        }
                                                        .myul-tabs a:before{
                                                            display:none;

                                                        }
                                                    </style>
                                                    <div class="col-md-12 col-sm-12 col-xs-12">
                                                         <asp:Menu
                                                            id="sub_menu"
                                                            Orientation="Horizontal"   
                                                            OnMenuItemClick="Menu1_MenuItemClick"
                                                            StaticMenuStyle-CssClass="nav nav-pills myul-tabs"
                                                            StaticSelectedStyle-CssClass="active selected highlighted"
                                                            Runat="server">
       
                                                            <Items>
                                                            <asp:MenuItem Text="Apply for Plot" Value="0" />
                                                            <asp:MenuItem Text="Apply Area Wise" Value="1" />                                                     
                                                            </Items>    

                                                        </asp:Menu>
                                                        <div class="clearfix"></div>
                                                        <div style="    border: 3px solid #c5c5c5;min-height: 100px;background: #e2e2e2;">


                                                            <asp:MultiView runat="server" ID="multi">
                                                                <asp:View ID="viewPlotPreference" runat="server">
                                                                    <div class="form-group" style="padding: 7px 0;">
                                                                        <div>
                                                                        <div class="col-md-12 col-sm-12 col-xs-12 font-bold">
                                                                            <span style="font-size: 15px;">Choose plot preference from the available plots</span><br />
                                                                            (You can choose any one preference)
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                        <div class="col-md-4 col-sm-2 col-xs-2">
                                                                            P <asp:TextBox ID="txtp1" runat="server" CssClass="margin-left-z input-sm similar-select1"  Style="background: #fff;margin:3px 0;" Width="80%" Enabled="false"></asp:TextBox>
                                                                        </div>                                                    
                                                                                                                            
                                                                        <div class="clearfix"></div>
                                                                        <hr class="myhrline" />
                                                                    </div>
                                                                    </div>
                                                                </asp:View>
                                                                <asp:View ID="viewSubdivision" runat="server">
                                                                    <div class="form-group" style="padding: 7px 0; background: #ececec;">
                                                                        <div class="col-md-6 col-sm-6 col-xs-6 font-bold">
                                                                            <span style="font-size: 15px;">Enter Required Area</span><br />
                                                                            (In case you don't have any plot preference)
                                                                        </div>
                                                                        <div class="col-md-6 col-sm-6 col-xs-6">
                                                                            <asp:TextBox ID="txtEnterRequiredArea" runat="server" CssClass="margin-left-z input-sm similar-select1" onblur ="ValidateFill(this);" Style="background: #fff; margin-top: 5px;" Width="73%" ></asp:TextBox> (In Sqmt)
                                                                        </div>

                                                                        <div class="clearfix"></div>
                                                                        <hr class="myhrline" />
                                                                    </div>
                                                                  
                                                                </asp:View>
                                                               
                                                            </asp:MultiView>
                                                        </div>
                                                    </div>
                                                   
                                                    <div class="form-group" style="padding: 7px 0; background: #ececec;">
                                                      
                                                        <div class="form-group">
                                                            <div class="col-md-12 col-sm-12 col-xs-12 font-bold">
                                                                <span style="font-size: 15px;" class="note-block"> Dear Investor, We have saved your preferences. you are kindly requested to view the deposit estimates based on your selections by clicking on Get Estimated Cost.The allotment rate mentioned here is tentative and allotment shall be made at rate prevailing on date of issue of Regular Letter of Allotment. In case, because of any circumstances of non-availability of plots as per your selection UPEIDA may proposed the other options opted by you. Please select anyone of your choice to proceed further.
                                                                    <asp:Button ID="btngetdata" runat="server" Text="Get Estimated Deposites" CssClass="btn btn-sm btn-default pull-right" Style="margin: 0px 2px;background: #eaa421;color: #fff;font-weight: 700;" OnClientClick="return InputValidation();" />
                                                                </span>
                                                            
                                                            </div>
                                                            <div class="clearfix"></div>
                                                           
                                                        <hr class="myhrline" />
                                                        <div class="col-md-12 col-sm-12 col-xs-12">
                                                            <asp:Button ID="btnSave" CssClass="btn-primary btn-sm ey-bg pull-right" Text="Proceed"  runat="server" OnClientClick="return InputValidation();" />
                                                            <asp:Button runat="server" ID="hidbtn" ClientIDMode="Static" Text="btnSave"   style="display:none;"  />
                                                        </div>
                                                    </div>
                                                <asp:Label ID="lblServiceRequestID" runat="server" Visible="false" ></asp:Label>



                                                    </div>
                                            </div>
                                                <div class="col-md-3 col-sm-6 col-xs-12" style="border: 1px solid #ccc;margin: 0 0 6px 0;background: #ececec;border-left: 3px solid #ccc;min-height: 340px;">
                                                    
                                                    <div class="panel-heading" id="GridHeader" runat="server">List of available plots</div>
                                                       <div style="max-height: 292px;/* min-height: 297px; */overflow-y: auto;">
                                                           
                                                              <asp:GridView ID="GridPlot" runat="server" AutoGenerateColumns="false" Visible="false"
                                                                CssClass="table table-striped table-bordered table-hover request-table" DataKeyNames="PlotNo,PlotArea" EmptyDataText="No Plot Available">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblApplication" runat="server" Text="<%# (Container.DataItemIndex) + 1 %>"> 
                                                                            </asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="PlotNo" HeaderText="Plot No" SortExpression="PlotNo" />
                                                                    <asp:BoundField DataField="PlotArea" HeaderText="Plot Area" SortExpression="PlotArea" />
                                                                    <asp:TemplateField HeaderText="Choose">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox runat="server" ID="check" AutoPostBack="true" Class="product-list" aria-hidden="true" ToolTip="Click here to Choose Plot " OnCheckedChanged="check_CheckedChanged" />
                                                                        </ItemTemplate>

                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            <asp:GridView ID="GridSubDivision" runat="server" AutoGenerateColumns="false" Visible="false"
                                                                CssClass="table table-striped table-bordered table-hover request-table" DataKeyNames="PlotNo,PlotArea" EmptyDataText="No Plot Available">
                                                                <Columns>
                                                                    <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="lblApplication" runat="server" Text="<%# (Container.DataItemIndex) + 1 %>"> 
                                                                            </asp:Label>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateField>
                                                                    <asp:BoundField DataField="PlotNo" HeaderText="Plot No" SortExpression="PlotNumber" />
                                                                    <asp:BoundField DataField="PlotArea" HeaderText="Plot Area" SortExpression="PlotArea" />
                                                                    <asp:TemplateField HeaderText="Choose">
                                                                        <HeaderStyle HorizontalAlign="Left" />
                                                                        <ItemStyle HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:CheckBox runat="server" ID="checkSubdivision" AutoPostBack="true" Class="product-list" aria-hidden="true" ToolTip="Click here to Choose Plot " />
                                                                        </ItemTemplate>

                                                                    </asp:TemplateField>
                                                                </Columns>
                                                            </asp:GridView>
                                                            
                                                    </div>
                                                </div>

                                            </div>

                                            <div class="clearfix"></div>
                                            <div class="panel-heading font-bold">Deposite Details Based on your Choice</div>
                                            <div style="border: 1px solid #ccc;">
                                                <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                            </div>

                                        </asp:View>

                                        <asp:View runat="server" ID="View4">
                                           
                                            <asp:PlaceHolder runat="server" ID="PlaceHolder2"></asp:PlaceHolder>

                                        </asp:View>

                                  

                                    </asp:MultiView>





                                </div>
                            </div>
                        </div>
                    </div>
                </div>
           </ContentTemplate>
        </asp:UpdatePanel>
    </form>
        
       
</body>
</html>
