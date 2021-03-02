<%@ Page Title="" Language="C#" MasterPageFile="MainUser.Master" AutoEventWireup="true" CodeBehind="NewUserCreation.aspx.cs" Inherits="Allotment.NewUserCreation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<%@ Register Assembly="ProudMonkey.Common.Controls" Namespace="ProudMonkey.Common.Controls" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
        .box-panel {
            -webkit-box-shadow: 0 1px 1px transparent;
            box-shadow: 0 1px 1px transparent;
        }

        .box-back-none {
            background: none !important;
            box-shadow: inset 0px 1px 1px transparent !important;
        }

        .tooltip {
            position: absolute;
            top: 0;
            left: 0;
            z-index: 3;
            display: none;
            background-color: #FB66AA;
            color: White;
            padding: 5px;
            font-size: 10pt;
            font-family: Arial;
        }

        td {
            cursor: pointer;
        }
    </style>
 <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.2.2/css/buttons.dataTables.min.css" />
<script type="text/javascript" src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/2.5.0/jszip.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.18/build/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.2.2/js/buttons.html5.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $('[id*=gridUsercreationdetails]').prepend($("<thead></thead>").append($('[id*=gridUsercreationdetails]').find("tr:first"))).DataTable({
                dom: 'Bfrtip',
                'aoColumnDefs': [{ 'bSortable': false, 'aTargets': [0] }],
                'iDisplayLength': 20,
                buttons: [
                    { extend: 'copy', text: 'Copy to clipboard', className: 'exportExcel', exportOptions: { modifier: { page: 'all' } } },
                    { extend: 'excel', text: 'Export to Excel', className: 'exportExcel', filename: 'Agenda_Excel', exportOptions: { modifier: { page: 'all' } } },
                    { extend: 'csv', text: 'Export to CSV', className: 'exportExcel', filename: 'Agenda_Csv', exportOptions: { modifier: { page: 'all' } } },
                    { extend: 'pdf', text: 'Export to PDF', className: 'exportExcel', filename: 'Agenda_Pdf', orientation: 'landscape', pageSize: 'LEGAL', exportOptions: { modifier: { page: 'all' }, columns: ':visible' } }
                ]
            });
        });
    </script>
    <script type="text/javascript">
        function ValidateEmail() {

            
            var email = document.getElementById("<%= txtEmail.ClientID %>").value;
          
            var span = document.getElementById("EmailIDSpan");
            if (email.length > 0) {
                if (!IsValidEmail(email)) {

                    span.innerHTML = "Invalid Email ID";
                    span.style.color = "Red";
                    document.getElementById("<%= txtEmail.ClientID %>").value = "";
                    document.getElementById("<%= txtEmail.ClientID %>").style.borderColor = '#e52213';
                    return false;

                }
                else {
                    span.innerHTML = "";
                    document.getElementById("<%= txtEmail.ClientID %>").style.borderColor = "";
                    return true;
                }
            }
        }
        function ValidateMobile() {


            var email = document.getElementById("<%= txtEmail.ClientID %>").value;

             var span = document.getElementById("EmailIDSpan");
             if (email.length > 0) {
                 if (!IsValidEmail(email)) {

                     span.innerHTML = "Invalid Email ID";
                     span.style.color = "Red";
                     document.getElementById("<%= txtEmail.ClientID %>").value = "";
                    document.getElementById("<%= txtEmail.ClientID %>").style.borderColor = '#e52213';
                    return false;

                }
                else {
                    span.innerHTML = "";
                     document.getElementById("<%= txtEmail.ClientID %>").style.borderColor = "";
                     return true;
                 }
             }
         }
        function IsValidEmail(email) {
            var expr = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
            return expr.test(email);
        };
    </script>
    <script type="text/javascript">
        function isDecimalKey(evt) {
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode != 46 && charCode > 31
                && (charCode < 48 || charCode > 57)) {
                return false;
            } else {


            }
        }

    </script>
    <script type="text/javascript">
        function CheckPasswordStrength(password) {
            var password_strength = document.getElementById("password_strength");

            //TextBox left blank.
            if (password.length == 0) {
                password_strength.innerHTML = "";
                return;
            }

            //Regular Expressions.
            var regex = new Array();
            regex.push("[A-Z]"); //Uppercase Alphabet.
            regex.push("[a-z]"); //Lowercase Alphabet.
            regex.push("[0-9]"); //Digit.
            regex.push("[$@$!%*#?&]"); //Special Character.

            var passed = 0;

            //Validate for each Regular Expression.
            for (var i = 0; i < regex.length; i++) {
                if (new RegExp(regex[i]).test(password)) {
                    passed++;
                }
            }

            //Validate for length of Password.
            if (passed > 2 && password.length > 8) {
                passed++;
            }

            //Display status.
            var color = "";
            var strength = "";
            switch (passed) {
                case 0:
                case 1:
                    strength = "Weak";
                    color = "red";
                    break;
                case 2:
                    strength = "Good";
                    color = "darkorange";
                    break;
                case 3:
                case 4:
                    strength = "Strong";
                    color = "green";
                    break;
                case 5:
                    strength = "Very Strong";
                    color = "darkgreen";
                    break;
            }
            password_strength.innerHTML = strength;
            password_strength.style.color = color;
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>





            <cc1:MessageBox ID="MessageBox1" runat="server" />
            <cc1:ConfirmBox ID="ConfirmBox1" runat="server" />


            <div class="row">
                <div class="col-md-12" style="background: #dbdbdb;display:none;">
                    <div>
                        <div style="width: 100px; float: left; background: #dbdbdb; font-size: 11px;" class="text-center">
                            <br />
                            <ul class="list-inline master-nav-icons master-nav-iconsbr" style="border-top: 1px solid #ccc;">
                                <li class="disabled">
                                    <a runat="server" onserverclick="Home_ServerClick">
                                        <i class="fa fa-home" aria-hidden="true"></i>
                                        <br />
                                        Home
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div style="float: left; background: #dbdbdb; border-left: 1px solid #000; font-size: 11px;" class="text-center">
                            Operate<br />
                            <ul class="list-inline master-nav-icons master-nav-iconsbr" style="border-top: 1px solid #ccc;">
                                <li>
                                    <a runat="server" id="SaveEntry" onserverclick="SaveEntry_ServerClick">
                                        <i class="fa fa-floppy-o " aria-hidden="true"></i>
                                        <br />
                                        Save
                                    </a>
                                </li>
                                <li>
                                    <a runat="server" onserverclick="Unnamed_ServerClick" >
                                        <i class="fa fa-refresh" aria-hidden="true"></i>
                                        <br />
                                        Refresh
                                    </a>
                                </li>
                            </ul>
                        </div>
                        <div style="float: left; background: #dbdbdb; border-left: 1px solid #000; border-right: 1px solid #000; font-size: 11px;" class="text-center">
                            User Registration<br />
                            <ul class="list-inline master-nav-icons master-nav-iconsbr" style="border-top: 1px solid #ccc;">
                                <li>
                                    <a runat="server" onserverclick="Unnamed_ServerClick1">
                                        <i class="fa fa-plus" aria-hidden="true"></i>
                                        <br />
                                        New
                                    </a>
                                </li>
                              

                            </ul>
                        </div>
                    
                    </div>
                </div>
                <div class="clearfix"></div>
                <div class="row">
                    <asp:Label ID="RateIdlbl" runat="server" Visible="false"></asp:Label>
                    <div class="panel">
                        <div class="">
                            <div class="col-md-12">
                                <div class="panel-heading font-bold" style="text-align: center;">
                                    User Creation                          
                                </div>
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                User Name :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                                <asp:TextBox ID="txtusername" runat="server" AutoComplete="off"   CssClass="similar-select1 input-sm"></asp:TextBox> 
                                            </div>
                                            <asp:RequiredFieldValidator ID="reqUserName" ControlToValidate="txtusername"  ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group" runat="server" id="passworddiv">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Password :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                               <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" autocomplete="new-password" CssClass="similar-select1 input-sm" onkeyup="CheckPasswordStrength(this.value)"></asp:TextBox>
                                                 
                                            </div>
                                           <span id="password_strength" class="col-md-4 col-sm-12"></span>
                                            <asp:RequiredFieldValidator ID="reqword" ControlToValidate="txtPassword" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>  
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Designation :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                                <asp:DropDownList ID="ddlDesignation" runat="server"  CssClass="similar-select1 margin-left-z dropdown-toggle input-sm"  ></asp:DropDownList> 
                                            </div>
                                               <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="ddlDesignation" ValidationGroup="LoginFrame" InitialValue="0" runat="server" ForeColor="Red" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Department :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                               <asp:DropDownList ID="ddlDepartment" runat="server"  CssClass="similar-select1 margin-left-z dropdown-toggle input-sm"  ></asp:DropDownList> 
                                            </div>
                                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="ddlDepartment" ValidationGroup="LoginFrame" InitialValue="0" runat="server" ForeColor="Red" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Qualification :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                               <asp:DropDownList ID="ddlQuaification" runat="server"  CssClass="similar-select1 margin-left-z dropdown-toggle input-sm"  ></asp:DropDownList> 
                                            </div>
                                           <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="ddlQuaification" ValidationGroup="LoginFrame"  InitialValue="0" runat="server" ForeColor="Red" />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Employee Code :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                                <asp:TextBox ID="txtEmpcode" runat="server" CssClass="input-sm similar-select1"></asp:TextBox>
                                            </div>
                                             <asp:RequiredFieldValidator ID="ReqEmpcode" ControlToValidate="txtEmpcode" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                               Joining Date :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                                 <asp:TextBox ID="txtJoiningDate" runat="server" placeholder="dd/mm/yyyy" CssClass="date input-sm similar-select1" ToolTip="Enter Date In dd/mm/yyyy Format"></asp:TextBox>
                                            </div>
                                             <asp:RequiredFieldValidator ID="ReqJoiningDate" ControlToValidate="txtJoiningDate" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Retirement Date :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                               <asp:TextBox ID="txtRetirementDate" runat="server" placeholder="dd/mm/yyyy" CssClass="date input-sm similar-select1" ToolTip="Enter Date In dd/mm/yyyy Format"></asp:TextBox>
                                            </div>
                                              <asp:RequiredFieldValidator ID="ReqRetirementDate" ControlToValidate="txtRetirementDate" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />

                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Employment Type :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                               <asp:TextBox ID="txtContractType" runat="server" CssClass="input-sm similar-select1"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="ReqContractType" ControlToValidate="txtContractType" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group ">
                                        <div class="row ">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Email ID:
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                                <asp:TextBox ID="txtEmail" runat="server" CssClass="input-sm similar-select1"></asp:TextBox>
                                            </div>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
    ForeColor="Red" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$"
    Display = "Dynamic" ErrorMessage = "Invalid email address"/>
<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="LoginFrame" ControlToValidate="txtEmail"
    ForeColor="Red" Display = "Dynamic" ErrorMessage = "Required" />    </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />



                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Phone Number :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                               <asp:TextBox ID="txtphoneNo" runat="server" MaxLength="10" CssClass="input-sm similar-select1" onkeypress="return isDecimalKey(event);"></asp:TextBox>
                                            </div>
                                              <asp:RequiredFieldValidator ID="ReqphoneNo" ControlToValidate="txtphoneNo" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-2 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Employee Name :
                                            </label>
                                            <div class="col-md-6 col-sm-12">
                                               <asp:TextBox ID="txtEmployee" runat="server" CssClass="input-sm similar-select1"></asp:TextBox>
                                            </div>
                                             <asp:RequiredFieldValidator ID="ReqEmployee" ControlToValidate="txtEmployee" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>                                                                        
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12" style="text-align: center;">
                                            <asp:Button ID="BtnSubmit" runat="server" CssClass="btn btn-sm btn-primary" Text="Submit" OnClick="BtnSubmit_Click" ValidationGroup="LoginFrame" />
                                            <asp:Button ID="BtnClear" runat="server" CssClass="btn btn-sm btn-primary" Text="Clear" OnClick="BtnClear_Click"  />
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <asp:Label ID="msg" runat="server"></asp:Label>
                                   
                                  
                                </div>
                            </div>
                        </div>

                    </div>
                </div>







                <div class="row">
                    <div class="panel">
                        <div class="col-md-12">
                            <div class="clearfix"></div>
                            <div class="panel-heading">
                                <div class="col-md-6 font-bold" style="margin-top: 12px;">
                                    Existing Users Record
                                </div>
                            
                                <div class="clearfix"></div>

                            </div>
                            <div class="panel-body gallery  table-responsive">
                                <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                                <asp:GridView ID="gridUsercreationdetails" runat="server" ClientIDMode="Static" AutoGenerateColumns="false"  CssClass="table table-striped table-bordered table-hover request-table" OnRowCommand="gridUsercreationdetails_RowCommand">
                                    <Columns>


                                        <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApplication" runat="server" Text="<%# (Container.DataItemIndex) + 1 %>"> 
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="EMPLOYEENAME" HeaderText="Employee Name" SortExpression="EMPLOYEENAME" />
                                        <asp:BoundField DataField="DeptName" HeaderText="Department" SortExpression="DeptName" />
                                        <asp:BoundField DataField="UserName" HeaderText="User Name" SortExpression="UserName" />
                                        <asp:BoundField DataField="DesignationName" HeaderText="Designation Name" SortExpression="DesignationName" />
                                        <asp:BoundField DataField="Qualification" HeaderText="Qualification" SortExpression="Qualification" />
                                        <asp:BoundField DataField="emailID" HeaderText="Email ID" SortExpression="emailID" />
                                        <asp:BoundField DataField="phoneNo" HeaderText="Phone Number" SortExpression="phoneNo" />
                                        


                                        <asp:TemplateField HeaderText="Update">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>


                                                <asp:LinkButton runat="server" ID="btnEdit" CssClass="fa fa-sign-in" CommandName="Process" CommandArgument='<%#Eval("UserID") %>' ToolTip="Click here For Update Rate " />
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnDelete" CssClass="fa fa-trash-o" CommandName="Delete" CommandArgument='<%#Eval("UserID") %>' OnClientClick="javascript:return confirm('Are you sure wanted to delete?');" ToolTip="Click here to delete Rate" />
                                                </span>  
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <EmptyDataTemplate>
                                        No Record Available
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>





</asp:Content>
