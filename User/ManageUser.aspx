<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="ManageUser.aspx.cs" Inherits="User_ManageUser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script src="../Scripts/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () { 
                if ($("#txtFName").val() == "")
                {
                    alert("Please Enter Your First Name..!");
                }
                if ($("#txtMName").val() == "") {
                    alert("Please Your Middle Name..!");
                }
                if ($("#txtLName").val() == "") {
                    alert("Please Enter Your Last Name..!");
                }
                if ($("#txtAddress1").val() == "") {
                    alert("Please Enter Your phone Number..!");
                }
                if ($("#txtMno1").val() == "") {
                    alert("Please Enter Your Fax Number..!");
                }
                if ($("#txtEmail1").val() == "") {
                    alert("Please Enter Email Id..!");
                }
                if ($("#txtPass1").val() == "") {
                    alert("Please Enter Web Address..!");
                }
                if ($("#txtDob").val() == "") {
                    alert("Please Enter Employee Strength..!");
                }
                if ($("#txtJdate").val() == "") {
                    alert("Please Enter Your Password..!");
                }
            });
        });
    </script>   


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                                     <asp:Label ID="lblfname" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   
                                         
                                    </div>
                                <div class="row">
  <div class="col-lg-20">
      <span class="icon"><i></i></span>
      <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/img/search-icon.jpg" OnClick="ImageButton1_Click1"/>
      <asp:TextBox ID="TextBox7" runat="server"  placeholder="Search...."></asp:TextBox>  
      
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
                                    <asp:TextBox ID="txtMname" runat="server" class="form-control"  placeholder="Enter Middel Name "></asp:TextBox>
                                         </div>
                                     <asp:Label ID="lblmname" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

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
                                     <asp:Label ID="lbllname" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   
                                           
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Address</label>
                                <div class="col-lg-6">
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtAddress1" runat="server" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>
                                    </div>
                                     <asp:Label ID="lbladd" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   
                                    
                                      
                            </div>
                            <br>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
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
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Mobile No</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                   <span class="input-group-addon"><i class="fa fa-mobile fa-1x"></i></span>
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox ID="txtMno1" runat="server" MaxLength="12" class="form-control" TextMode="Number" placeholder="Enter Mobile No" Height="35px"></asp:TextBox>
                             </div>
                                     <asp:Label ID="lblmo" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   
                                           
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
                                     <asp:Label ID="lblemail" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                                           <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator6" ControlToValidate="txtMno1" ErrorMessage="* This field is required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                         
                            </div>
                                      </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Password</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                     <span class="input-group-addon"><i class="fa fa-key"></i></span>
                                    <%--<input type="text" class="form-control" id="b-day" placeholder=" ">--%>
                                    <asp:TextBox ID="txtPass1" runat="server" TextMode="Password" class="form-control" placeholder="Enter Password" Height="35px"></asp:TextBox>
                                 </div>
                                     <asp:Label ID="lblpass" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                                           <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator7" ControlToValidate="txtPass1" ErrorMessage="* Password is required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                      
                                     
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
                                     <asp:Label ID="lbldob" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                                    </div>
                            </div>
                      
                             <br>
                                 <div class="row">
                                <label class="col-lg-2 control-label">Join Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox ID="txtJdate" runat="server" TextMode="Date" class="form-control" Height="35px" ></asp:TextBox>
                                </div>
                                     <asp:Label ID="lbljdate" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>   

                                    </div>
                            </div>
                             <br>
                                 
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                  <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click"/>
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                    <h1>Grid View  </h1>
                                        <asp:GridView ID="GridView1" runat="server" Height="16px" Width="16px" AutoGenerateColumns="False" DataKeyNames="EmpId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowCommand="GridView1_RowCommand1" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" BackColor="#CCCCCC" BorderColor="Gray" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black"  >
                                            <Columns>
                                                <asp:TemplateField HeaderText="FName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="MName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("MName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("MName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="LName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("LName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="MobileNo">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("MobileNo") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("MobileNo") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Email">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="JoinDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("JoinDate","{0:MMM-dd-yyyy}") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("JoinDate","{0:MMM-dd-yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                    <ItemStyle Wrap="False" />
                                                </asp:TemplateField>
                                                 <asp:TemplateField HeaderText="Update">
                                                   
                                                      <ItemTemplate>
                                                          <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Bind("EmpId") %>' CommandName="Update">Update</asp:LinkButton>
                                                     </ItemTemplate>
                                                      <HeaderStyle ForeColor="White" />
                                                      </asp:TemplateField>
                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" >
                                                <ControlStyle CssClass="btn-danger" />
                                                </asp:CommandField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                                            <RowStyle BackColor="White" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="Gray" />
                                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                            <SortedDescendingHeaderStyle BackColor="#383838" />
                                        </asp:GridView>
                                  
                                    <div class="row">

                                     </div>
                                </div>

                            </div>

                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>-
</asp:Content>

