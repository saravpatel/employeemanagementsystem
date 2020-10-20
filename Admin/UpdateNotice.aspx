<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AMasterPage.master" AutoEventWireup="true" CodeFile="UpdateNotice.aspx.cs" Inherits="Admin_UpdateNotice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Update Notice</h1>

                           <div class="row">
                                <label class="col-lg-2 control-label">Email</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                     <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span> 
                                         <asp:TextBox ID="txtTo" runat="server" class="form-control" placeholder="Enter Email Id"></asp:TextBox>
                                </div>
                                         <asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtTo" ErrorMessage="* Email must be required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>
                                         
                                </div>
                            </div>
                            <br>
                              <div class="row">
                                <label class="col-lg-2 control-label">Remark/Notification</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                     <span class="input-group-addon"><i class="fa fa-comments"></i></span>
                                    <asp:TextBox ID="txtRemark" runat="server" class="form-control" placeholder="Enter Your Message..!!"></asp:TextBox>
                                </div>
                                         <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtRemark" ErrorMessage="* Remark must be required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                          <br>
                            <div class="form-group">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Send</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Send" OnClick="Button1_Click1" />
                                  
                                    
                                   
                                </div>

                            </div>

                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

