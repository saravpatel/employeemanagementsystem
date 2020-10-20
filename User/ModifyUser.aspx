<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="ModifyUser.aspx.cs" Inherits="User_ModifyUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Manage User</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">First Name</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox ID="txtFName" runat="server" class="form-control" placeholder="Enter First Name "></asp:TextBox>
                                </div>
                                    </div>
                                <div class="row">
  <div class="col-lg-20">
      <span class="icon"><i class="fa fa-search"></i></span>
      <input type="search" id="search" placeholder="Search..." />
  </div>
</div>
                            </div> 
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Middel Name</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox ID="txtMname" runat="server" class="form-control" placeholder="Enter Middel Name "></asp:TextBox>
                                </div>
                            </div>
                                </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Last Name</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox ID="txtLname" runat="server" class="form-control" placeholder="Enter Last Name "></asp:TextBox>
                                </div>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Address</label>
                                <div class="col-lg-6">
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtAddress1" runat="server" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">State</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                    <asp:DropDownList ID="DropDownState1"  CssClass="form-control" runat="server" Height="35px" OnSelectedIndexChanged="DropDownState1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>
                                </div>
                                    </div>
                            </div>
                            <br>
                             <div class="row">
                                <label class="col-lg-2 control-label">City</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                    <asp:DropDownList ID="DropDownCity1"  class="form-control" runat="server" Height="35px" ></asp:DropDownList>
                                </div>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Mobile No</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-mobile fa-1x"></i></span>
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox ID="txtMno1" runat="server" MaxLength="12" class="form-control" placeholder="Enter Mobile No" Height="35px"></asp:TextBox>
                                </div>
                                    </div>
                                </div>
                            <br>
                            
                         
                                  <div class="row">
                                <label class="col-lg-2 control-label">Email</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                                   
                                    <asp:TextBox ID="txtEmail1" runat="server" TextMode="Email" class="form-control" placeholder="http://www.demowebsite.com" Height="35px"></asp:TextBox>
                                </div>
                            </div>
                                      </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Password</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                     <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                    <%--<input type="text" class="form-control" id="b-day" placeholder=" ">--%>
                                    <asp:TextBox ID="txtPass1" runat="server" TextMode="Password" class="form-control" placeholder="Enter Web Address" Height="35px"></asp:TextBox>
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
                                <label class="col-lg-2 control-label">Designation Id</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-certificate"></i></span>
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                    <asp:DropDownList ID="DropDownDId"  class="form-control"  runat="server" Height="35px"></asp:DropDownList>
                                </div>
                                    </div>
                            </div>
                            <br>
                             <div class="row">
                                <label class="col-lg-2 control-label">Date of Birth</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                    <asp:TextBox ID="txtDob" runat="server" TextMode="Date" class="form-control" Height="35px"></asp:TextBox>
                                </div>
                                    </div>
                            </div>
                      
                             <br>
                                 <div class="row">
                                <label class="col-lg-2 control-label">Jion Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox ID="txtJdate" runat="server" TextMode="Date" class="form-control" Height="35px" ></asp:TextBox>
                                </div>
                                    </div>
                            </div>
                             <br>
                                 
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                  <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Update" OnClick="Button1_Click"/>
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                    <h1>Grid View  </h1>
                                        
                                  
                                    
                                </div>

                            </div>

                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

