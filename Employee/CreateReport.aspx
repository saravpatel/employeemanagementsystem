<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="CreateReport.aspx.cs" Inherits="Employee_CreateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Create Report</h1>

                            
                           <div class="row">
                                <label class="col-lg-2 control-label">Project Completion</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-check"></i></span> 
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtDes" runat="server" TextMode="Number"  CssClass="form-control" ></asp:TextBox>
                                        </div>
                                            <asp:RequiredFieldValidator runat="server" ID="txtBname1" ControlToValidate="txtDes" ErrorMessage="* fill this field" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>
                              
                            </div>
                               </div>
                            <br>

                             <div class="row">
                                <label class="col-lg-2 control-label">Month</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                        <asp:DropDownList ID="DropDownList1"  CssClass="form-control" runat="server">
                                            <asp:ListItem>January</asp:ListItem>
                                            <asp:ListItem>Febuary</asp:ListItem>
                                            <asp:ListItem>March</asp:ListItem>
                                            <asp:ListItem>April</asp:ListItem>
                                            <asp:ListItem>May</asp:ListItem>
                                            <asp:ListItem>June</asp:ListItem>
                                            <asp:ListItem>July</asp:ListItem>
                                            <asp:ListItem>Auguast</asp:ListItem>
                                            <asp:ListItem>sep</asp:ListItem>
                                            <asp:ListItem>October</asp:ListItem>
                                            <asp:ListItem>November</asp:ListItem>
                                            <asp:ListItem>Decemmber</asp:ListItem>
                                        </asp:DropDownList>
                                                                        </div>
                            </div>
                              </div>
                            <br />
                            <%--<div class="row">
                                <label class="col-lg-2 control-label">Employee Id</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <input type="text" class="form-control" id="c-name" placeholder=" ">
                                    <asp:DropDownList ID="DropDownEmp"  CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    </div>
                             </div>
                            <br>--%> 
                         
                            <div class="row">
                                <label class="col-lg-2 control-label">Project Name</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-tasks"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:DropDownList ID="DropDownProject"  CssClass="form-control" runat="server" OnSelectedIndexChanged="DropDownProject_SelectedIndexChanged"></asp:DropDownList>
                                         <asp:HiddenField ID="HiddenField1" runat="server" />
                                </div>
                                    </div>
                            </div>
                            <br>

                         
                            <br>             
                      
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel"/>
                                    <br>
                                </div>

                            </div>
                            <br />
                           
                                    <div class="col-lg-offset-3">
                                          <h1>Grid View</h1>
                                        <asp:GridView ID="GridView1" runat="server" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                            <RowStyle BackColor="White" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#383838" />
                                            



                                        </asp:GridView>
                                        </div>
                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

