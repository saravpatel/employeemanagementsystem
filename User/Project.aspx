<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="Project.aspx.cs" Inherits="User_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () { 
                if ($("#txtDes").val() == "")
                {
                    alert("Please Enter Discription..!");
                }
                if ($("#txtSdate").val() == "") {
                    alert("Please Enter Start Date.....!");
                }
                if ($("#txtEdate").val() == "") {
                    alert("Please Enter End Date.....!");
                }
                if ($("#txtPdate").val() == "") {
                    alert("Please Enter Project Date.....!");
                }
                
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Assign Project</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Project Name</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-star"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:DropDownList ID="DropDownProject"  CssClass="form-control" runat="server" AutoPostBack="true">
                                        
                                        </asp:DropDownList>
                                </div>
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
                                <label class="col-lg-2 control-label">Description</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtDes" runat="server" TextMode="MultiLine" CssClass="form-control" width="485px" Height="45px"></asp:TextBox>
                                </div>
                                    <asp:Label ID="lbldes" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Start Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox id="txtSdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                                </div>
                                    <asp:Label ID="lblsdate" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>

                                    </div>
                            </div>
                            <br>

                             <div class="row">
                                <label class="col-lg-2 control-label">End Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                    <asp:TextBox id="txtEdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                                </div>
                                    <asp:Label ID="lbledate" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>

                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Project Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtPdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                                </div>
                                    <asp:Label ID="lblpdate" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>

                                    </div>
                                </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Employee Id</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-user"></i></span> 
                                    <%--<input type="text" class="form-control" id="c-name" placeholder=" ">--%>
                                    <asp:DropDownList ID="DropDownEmp"  CssClass="form-control" runat="server" Height="35px" AutoPostBack="false" ></asp:DropDownList>
                                </div>
                            </div>
                                </div>
                            <br>

                                  
                      
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click1" />
                                
                                    <asp:Button ID="Button3" runat="server" CssClass="btn btn-success" Text="Update" Visible="false" OnClick="Button3_Click"  />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" Visible="false"  />
                                    </div>
                                </div>
                                    <br>
                                     <div class="row">
                                     <div class="col-lg-2 col-lg-10">    
                                    <h1>All Project</h1>
                                         <asp:ScriptManager ID="ScriptManager2" runat="server"></asp:ScriptManager>
                                         <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                             <ContentTemplate>
                                                 <asp:GridView ID="GridView1" runat="server" PageSize="5" AllowPaging="true"   DataKeyNames="ProjectId" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating1" OnRowCommand="GridView1_RowCommand" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnPageIndexChanging="GridView1_PageIndexChanging1" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="ProjectId">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("ProjectId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProjectId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ProjectName">
                                                    <EditItemTemplate>
                                                        <%--<asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProjectName") %>'></asp:TextBox>--%>
                                                        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                            <ContentTemplate>
                                                        <asp:DropDownList ID="ddlp" runat="server" AutoPostBack="True" Height="18px" Width="109px">
                                                        </asp:DropDownList>

                                                            </ContentTemplate>
                                                            </asp:UpdatePanel>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProjectNameAll") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Discription">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Discription") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Discription") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ProjectDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ProjectDate","{0:dd/MM/yyyy}") %>' Height="16px" Width="83px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProjectDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EmpId">
                                                    <EditItemTemplate>
                                                        <%--<asp:Label ID="Label9" runat="server" Text='<%# Bind("FName") %>'></asp:Label>--%>
                                                        <asp:DropDownList ID="ddle" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="StartDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("StartDate","{0:dd/MM/yyyy}") %>' Height="16px" Width="75px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("StartDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EndDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("EndDate","{0:dd/MM/yyyy}") %>' Height="16px" Width="69px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("EndDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                 
                                                <asp:CommandField ShowEditButton="True" ButtonType="Button" >
                                 
                                                <ControlStyle CssClass="btn-success" />
                                                <ItemStyle Wrap="False" />
                                                </asp:CommandField>
                                 
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
                                            <PagerSettings Mode="Numeric" PageButtonCount="4" />
                                        </asp:GridView>
                                             </ContentTemplate>
                                         </asp:UpdatePanel>
                                        
                                     </div>
                                </div>
                            </div>

                            
                        </div>
                   
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

