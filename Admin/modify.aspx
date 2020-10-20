<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AMasterPage.master" AutoEventWireup="true" CodeFile="modify.aspx.cs" Inherits="Admin_modify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Add Admin</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Company Name</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span> <asp:TextBox ID="txtCname" runat="server" class="form-control" placeholder="Enter Your Company Name" Width="290px"></asp:TextBox>
                                </div>
                                 
  
  <%--<input class="form-control" type="text" placeholder="Email address">--%>
</div>
                            </div>
                           <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Address</label>
                                <div class="col-lg-6">
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" Width="330px" ></asp:TextBox>
                                </div>
                            </div>
                            <br>
                             <div class="row">
                                <label class="col-lg-2 control-label">State</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-home"></i></span> <asp:DropDownList ID="DropDownState" AutoPostBack="true" runat="server" class="form-control" Width="290px" Height="35px" OnSelectedIndexChanged="DropDownState_SelectedIndexChanged1"></asp:DropDownList>
                                </div>
                               </div>
                          </div>
                            <br>
                             <div class="row">
                                <label class="col-lg-2 control-label">City</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-home"></i></span> <asp:DropDownList ID="DropDownCity" runat="server" class="form-control" Width="290px" Height="35px"></asp:DropDownList>
                                </div>
                               </div>
                          </div>
                            <br>
                              <div class="row">
                                <label class="col-lg-2 control-label">Mobile</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-mobile fa-1x"></i></span><asp:TextBox ID="txtMob" runat="server" class="form-control" Placeholder="Enter Mobaile No" Width="300px" Height="35px"></asp:TextBox>
                                </div>
                            </div>
                            </div>
                           <br>
                            
                             <div class="row">
                                <label class="col-lg-2 control-label">Phone</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-mobile fa-1x"></i></span> <asp:TextBox ID="txtPhone" runat="server" class="form-control" Placeholder="Enter Phone No" Width="300px" Height="35px"></asp:TextBox>
                                </div>
                            </div>
                            </div>
                            <br>
                                   <div class="row">
                                <label class="col-lg-2 control-label">Fax</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-fax"></i></span> <asp:TextBox ID="txtFax" runat="server" class="form-control" Placeholder="Enter Fax No" Width="290px"  Height="35px"></asp:TextBox>
                                </div>
                            </div>
                            </div>
                            <br>
                               <div class="row">
                                <label class="col-lg-2 control-label">Email</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <%-- <input type="text" class="form-control" id="url" placeholder="http://www.demowebsite.com ">--%>
                                   <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span> <asp:TextBox ID="txtEmail" runat="server" class="form-control" placeholder="Enter Your Email Id" Width="290px"  Height="35px"></asp:TextBox>
                                </div>
                            </div>
                            </div>
                            <br>
                             <div class="row">
                                <label class="col-lg-2 control-label">Web Address</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span> <asp:TextBox ID="txtWebAdd" runat="server" class="form-control" placeholder="Enter Your Web Address" Width="290px"  Height="35px"></asp:TextBox>
                                </div>
                            </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Photo</label>
                                <div class="col-lg-6">
                                    <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control"  Width="310px"  Height="45px"/>  
                                <%--<asp:Image ID="Photo" ImageUrl="~/img/avatar1.jpg" CssClass="img-circle" runat="server" />--%>
                                    
                                </div>
                                
                            </div>
                            <br>
                                  <div class="row">
                                <label class="col-lg-2 control-label">Employee Strength</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-users"></i></span><asp:TextBox ID="txtEmps" runat="server" class="form-control"  Width="290px"  Height="35px"></asp:TextBox>            

                                     </div>
                               </div>
                          </div>
                            <br>

                          <div class="row">
                                <label class="col-lg-2 control-label">Company Type Id</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-sitemap" ></i></span> <asp:DropDownList ID="DropDownCTypeId" runat="server" class="form-control" Width="300px" Height="35px"></asp:DropDownList>
                                    </div>
                              </div>
                        </div>
                      <br>
                                    <div class="row">
                                <label class="col-lg-2 control-label">Password</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                         <asp:TextBox ID="TextBox1" runat="server" class="form-control"  Width="290px"  Height="35px"></asp:TextBox>            

                                     </div>
                               </div>
                          </div>
                              <%--<div class="row">
                                <label class="col-lg-2 control-label">Password</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-users"></i></span><asp:TextBox ID="TextBox1" runat="server" class="form-control"  Width="290px"  Height="35px" ReadOnly="True" TextMode="Password"></asp:TextBox>            

                                     </div>
                               </div>
                          </div>--%>


                            <div class="row">
                                <label class="col-lg-2 control-label"></label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                  
                                         <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                                         
                                     </div>
                               </div>
                          </div>
                            <br>
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="Button1_Click1"  />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                                    <h1>&nbsp;</h1>
                                    <div class="row">
                                     </div>
                                </div>

                            </div>

                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

