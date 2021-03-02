<%@ Page Title="" Language="C#" MasterPageFile="MainUser.Master" AutoEventWireup="true" CodeBehind="AddDepartments.aspx.cs" Inherits="Allotment.AddDepartments" %>
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
            $('[id*=Grid_Departments]').prepend($("<thead></thead>").append($('[id*=Grid_Departments]').find("tr:first"))).DataTable({
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
 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePartialRendering="true">
    </asp:ScriptManager>





            <cc1:MessageBox ID="MessageBox1" runat="server" />
            <cc1:ConfirmBox ID="ConfirmBox1" runat="server" />


          
    
                <div class="row">
                    <asp:Label ID="RateIdlbl" runat="server" Visible="false"></asp:Label>
                    <div class="panel">
                        <div class="">
                            <div class="col-md-12">
                                <div class="panel-heading font-bold" style="text-align: center;">
                                    Add Deaprtments                          
                                </div>
                                <div class="panel-body">

                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-3 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Department Name (Nick Name) :
                                            </label>
                                            <div class="col-md-7 col-sm-12">
                                                <asp:TextBox ID="txtDeptNickName" runat="server"  CssClass="similar-select1 input-sm"></asp:TextBox> 
                                            </div>
                                            <asp:RequiredFieldValidator ID="ReqDeptNickName" ControlToValidate="txtDeptNickName" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator> 
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                    <hr class="myhrline" />
                                    <div class="form-group" runat="server" id="passworddiv">
                                        <div class="row">
                                            <label class="col-md-3 col-sm-12 text-right">
                                                <span style="color: Red">*</span>
                                                Department Name (Full Name) :
                                            </label>
                                            <div class="col-md-7 col-sm-12">
                                               <asp:TextBox ID="txtDeptFull" runat="server" CssClass="similar-select1 input-sm"></asp:TextBox>
                                                 
                                            </div>
                                           <span id="password_strength" class="col-md-2 col-sm-12"></span>
                                            <asp:RequiredFieldValidator ID="ReqDeptFull" ControlToValidate="txtDeptFull" ValidationGroup="LoginFrame" runat="server" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>  
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
                                    Existing Departments
                                </div>
                            
                                <div class="clearfix"></div>

                            </div>
                            <div class="panel-body gallery  table-responsive">
                                <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                                <asp:GridView ID="Grid_Departments" runat="server" ClientIDMode="Static" AutoGenerateColumns="false"  CssClass="table table-striped table-bordered table-hover request-table" OnRowCommand="Grid_Departments_RowCommand">
                                    <Columns>


                                        <asp:TemplateField HeaderText="S.No" HeaderStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:Label ID="lblApplication" runat="server" Text="<%# (Container.DataItemIndex) + 1 %>"> 
                                                </asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                        <asp:BoundField DataField="DeptFullName" HeaderText="Department (Full Name)" SortExpression="DeptFullName" />
                                        <asp:BoundField DataField="DeptNickName" HeaderText="Department (Nick Name)" SortExpression="DeptNickName" />
                                    


                                        <asp:TemplateField HeaderText="Update">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Center" />
                                            <ItemTemplate>


                                                <asp:LinkButton runat="server" ID="btnEdit" CssClass="fa fa-sign-in" CommandName="Process" CommandArgument='<%#Eval("ID") %>' ToolTip="Click here For Update Record" />
                                            </ItemTemplate>

                                        </asp:TemplateField>

                                        <asp:TemplateField HeaderText="Delete">
                                            <HeaderStyle HorizontalAlign="Left" />
                                            <ItemStyle HorizontalAlign="Left" />
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" ID="btnDelete" CssClass="fa fa-trash-o" CommandName="Deleted" CommandArgument='<%#Eval("ID") %>' OnClientClick="javascript:return confirm('Are you sure wanted to delete?');" ToolTip="Click here to delete Record" />
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
