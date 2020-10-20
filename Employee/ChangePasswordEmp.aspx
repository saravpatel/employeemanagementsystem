<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="ChangePasswordEmp.aspx.cs" Inherits="Employee_ChangePasswordEmp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Change Password</h1>

                             
                           <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Old Password</label>
                                <div class="col-lg-6">
                                    <div class="input-group">
  
                                    <%--<input class="form-control" type="password" placeholder="Password">--%>
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                   <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                         <asp:TextBox ID="txtOldPass" runat="server" class="form-control" TextMode="Password" placeholder="Enter Old Password"></asp:TextBox>
                               
                                         </div>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Enter New Password</label>
                                <div class="col-lg-6">
                                    <div class="input-group">
                                   <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtNewPass" runat="server"  CssClass="form-control" TextMode="Password" placeholder="Enter New Password"></asp:TextBox>
                                </div>
                            </div>
                                </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Confirm Password</label>
                                <div class="col-lg-6">
                                    <div class="input-group">
  
                                    
                                   <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox id="txtConPass" runat="server"  CssClass="form-control" TextMode="Password" placeholder="Enter Confirm Password"></asp:TextBox>
                                </div>
                            </div>
                                </div>
                            <br>

                          <%--  <div class="input-group margin-bottom-sm">
  <span class="input-group-addon"><i class="fa fa-envelope-o fa-fw"></i></span>
  <input class="form-control" type="text" placeholder="Email address">
</div>
<div class="input-group">
  <span class="input-group-addon"><i class="fa fa-key fa-fw"></i></span>
  <input class="form-control" type="password" placeholder="Password">
</div>--%>
                             

                          <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="*Current password is incorrect"></asp:Label>
                                        <asp:Label ID="Label2" runat="server" ForeColor="#FF3300" Text="*New passwrod and Confirm paswrod must be same"></asp:Label>
                             <asp:Label ID="Label3" runat="server" ForeColor="Blue" Text="Password is Change Successfully" Visible="False"></asp:Label>      
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <asp:Button ID="Button1" runat="server"  CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button2" runat="server"  class="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                </div>

                            </div>

                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

