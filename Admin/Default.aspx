<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
   


    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () { 
                if ($("#txtCname").val() == "")
                {
                    alert("Please Enter Company Name First..!");
                }
                if ($("#txtAddress").val() == "") {
                    alert("Please Enter Address..!");
                }
                if ($("#txtMob").val() == "") {
                    alert("Please Enter Mobaile Number..!");
                }
                if ($("#txtPhone").val() == "") {
                    alert("Please Enter Your phone Number..!");
                }
                if ($("#txtFax").val() == "") {
                    alert("Please Enter Your Fax Number..!");
                }
                if ($("#txtEmail").val() == "") {
                    alert("Please Enter Email Id..!");
                }
                if ($("#txtWebAdd").val() == "") {
                    alert("Please Enter Web Address..!");
                }
                if ($("#txtEmps").val() == "") {
                    alert("Please Enter Employee Strength..!");
                }
                if ($("#TextBox1").val() == "") {
                    alert("Please Enter Your Password..!");
                }
            });
        });
    </script>

    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <html>
    <head runat="server" />
    <form name="f1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                                    <span class="input-group-addon"><i class="fa fa-user"></i></span> 
                                         <asp:TextBox ID="txtCname" runat="server" class="form-control" placeholder="Enter Your Company Name" Width="290px"></asp:TextBox>
                                </div>
                                     <asp:Label ID="lblcname" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   
                                      <%--<asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="txtCname" ErrorMessage="* Company name must be required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                         
                                 
  
  <%--<input class="form-control" type="text" placeholder="Email address">--%>
</div>
                                                                <div class="row">
  <div class="col-lg-20">
      <span class="icon"><i></i></span>
      <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/img/search-icon.jpg" OnClick="ImageButton1_Click"/>
      <asp:TextBox ID="TextBox7" runat="server" placeholder="Search...."></asp:TextBox>  

      <%--<input type="search" id="search" placeholder="Search..." />--%>
  </div>
                                    
</div>

                            </div>
                           <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Address</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                        <%--<span class="input-group-addon"></span>--%> 
                                      <asp:TextBox id="txtAddress" runat="server" TextMode="MultiLine" CssClass="form-control" Width="330px" ></asp:TextBox>

                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                  </div>
                                     <asp:Label ID="lbladd" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                               </div>

                            </div>
                            <br>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <div class="row">
                                <label class="col-lg-2 control-label">State</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-home"></i></span> <asp:DropDownList ID="DropDownState" AutoPostBack="true" runat="server" class="form-control" Width="290px" Height="35px" OnSelectedIndexChanged="DropDownState_SelectedIndexChanged"></asp:DropDownList>
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
                                    </ContentTemplate>
                                  </asp:UpdatePanel>
                             
                            <br>
                              <div class="row">
                                <label class="col-lg-2 control-label">Mobile</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-mobile fa-1x"></i>

                                   </span><asp:TextBox ID="txtMob" runat="server" class="form-control" MaxLength="12" Placeholder="Enter Mobaile No" Width="300px" Height="35px"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtMob" FilterType="Numbers" />

                                        </div>
                                         <asp:Label ID="lblmob" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                                       <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtMob" ErrorMessage="* Mobile number must be required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                
                            </div>
                            </div>
                           <br>
                            
                             <div class="row">
                                <label class="col-lg-2 control-label">Phone</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-mobile fa-1x"></i></span> 
                                         
                                           <asp:TextBox ID="txtPhone" runat="server" class="form-control" MaxLength="12" TextMode="Number" Placeholder="Enter Phone No" Width="300px" Height="35px"></asp:TextBox>
                              </div>
                                     <asp:Label ID="lblphn" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                            </div>
                            </div>
                            <br>
                                   <div class="row">
                                <label class="col-lg-2 control-label">Fax</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-fax"></i></span> 
                                         <asp:TextBox ID="txtFax" runat="server" class="form-control" Placeholder="Enter Fax No" Width="290px"  Height="35px"></asp:TextBox>
                                </div>
                                     <asp:Label ID="lblfax" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                            </div>
                            </div>
                            <br>
                               <div class="row">
                                <label class="col-lg-2 control-label">Email</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <%-- <input type="text" class="form-control" id="url" placeholder="http://www.demowebsite.com ">--%>
                                   <span class="input-group-addon"><i class="fa fa-envelope-o"></i></span>
                                          <asp:TextBox ID="txtEmail" runat="server" class="form-control" TextMode="Email" placeholder="Enter Your Email Id" Width="290px" Height="35px"></asp:TextBox>
                              </div>
                                        <asp:Label ID="lblemail" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                                       <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtEmail" ErrorMessage="* Email-id must be required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                          
                            </div>
                            </div>
                            <br>
                             <div class="row">
                                <label class="col-lg-2 control-label">Web Address</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-envelope-o" aria-hidden="true"></i></span>
                                          <asp:TextBox ID="txtWebAdd" runat="server"  class="form-control" placeholder="Enter Your Web Address" Width="290px"  Height="35px"></asp:TextBox>
                                </div>
                                     <asp:Label ID="lblweb" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>    
                                      <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtWebAdd" ErrorMessage="* WebAddress must be required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                    
                            </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Photo</label>
                                <div class="col-lg-6">
                                    <asp:FileUpload ID="FileUpload1" runat="server"  class="form-control" Width="310px"  Height="45px"/>  
                                <%--<asp:Image ID="Photo" ImageUrl="~/img/avatar1.jpg" CssClass="img-circle" runat="server" />--%>
                                    
                                </div>
                                
                            </div>
                            <br>
                                  <div class="row">
                                <label class="col-lg-2 control-label">Employee Strength</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-users"></i></span>
                                         <asp:TextBox ID="txtEmps" runat="server" textmode="Number" class="form-control"  Width="290px"  Height="35px"></asp:TextBox>            
                                           </div>
                                          <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator5" ControlToValidate="txtEmps" ErrorMessage="* Enter number of employees" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                     <asp:Label ID="lblem" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   
                                   
                               </div>
                          </div>
                            <br>

                          <div class="row">
                                <label class="col-lg-2 control-label">Company Type Id</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-sitemap" ></i></span> 
                                         <asp:DropDownList ID="DropDownCTypeId" runat="server" class="form-control" Width="300px" Height="35px"></asp:DropDownList>
                                    </div>
                              </div>
                        </div>
                      <br>

                              <div class="row">
                                <label class="col-lg-2 control-label">Password</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-key" ></i></span>
                                         <asp:TextBox ID="TextBox1" runat="server" class="form-control"   Width="290px" TextMode="Password"  Height="35px"></asp:TextBox>
                                     </div>
                                         <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator4" ControlToValidate="txtWebAdd" ErrorMessage="*Password must be required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                     <asp:Label ID="lblpass" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                                          <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="TextBox1" ErrorMessage="* EnterPassword" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                     
                                      </div>
                        </div>
                      <br>
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                    <br />
                                    <h1>All Users</h1>
                                    <div class="row">
                                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="CompanyId" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black" Width="603px" OnRowDeleting="GridView1_RowDeleting"  >
                                            <Columns>
                                                <asp:TemplateField HeaderText="CompanyName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CompanyName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Mobile">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="E-mail">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Website">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Website") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Modify">
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="up" CommandArgument='<%# Bind("CompanyId") %>'>Update</asp:LinkButton>
                                                    </ItemTemplate> 
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>

                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" >
                                                <ControlStyle CssClass="btn-danger" />
                                                <HeaderStyle ForeColor="White" />
                                                </asp:CommandField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
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

                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>
        </head>
       </html>
</asp:Content>

