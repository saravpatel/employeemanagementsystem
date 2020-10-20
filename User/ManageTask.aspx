<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="ManageTask.aspx.cs" Inherits="User_ManageTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <script src="../Scripts/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () { 
                if ($("#txtSdate").val() == "")
                {
                    alert("Please Enetr Start date.....!");
                }
                if ($("#txtEdate").val() == "") {
                    alert("Please Eneter End date.....!");
                }
                if ($("#TextBox7").val() == "") {
                    alert("Please Enter Task date.....!");
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
                            <h1>Assign Task</h1>

                 
                            
                             <div class="row">
                                <label class="col-lg-2 control-label">Employee Name</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-user"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <%--<asp:TextBox id="txtPdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>--%>
                                         
                                        <asp:DropDownList ID="DropDownList3" CssClass="form-control" runat="server"  Height="35px" AutoPostBack="true" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged"></asp:DropDownList>
                                       </div>
                              
                                    </div>
                                
                            <br>

                                         
                              <div class="row">
  <div class="col-lg-20">
      <span class="icon"><i></i></span>
      <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/img/search-icon.jpg" OnClick="ImageButton1_Click"/>
      <asp:TextBox ID="TextBox8" runat="server" placeholder="Search...."></asp:TextBox>  
      <%--<input type="search" id="search" placeholder="Search..." />--%>
  </div>
                                    
</div>
                                 </div>
                            
                              <div class="row">
                                <label class="col-lg-2 control-label">Project Name</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-star"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <%--<asp:TextBox id="txtPdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>--%>
                                        <asp:DropDownList ID="DropDownList1"  CssClass="form-control" runat="server"  Height="35px" AutoPostBack="true"></asp:DropDownList>
                                        <%--<asp:HiddenField ID="HiddenField1" runat="server" />   OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"--%>
                                </div>
                                    </div>
                            
                   
                            </div>
                            <br />
                            
                               <div class="row">
                                <label class="col-lg-2 control-label">Task Name</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:DropDownList ID="DropDownTask"  CssClass="form-control" runat="server" >
                                        <%--<asp:ListItem>Designing</asp:ListItem>--%>
                                        <asp:ListItem>Design</asp:ListItem>
                                        <asp:ListItem>Coding</asp:ListItem>
                                        <asp:ListItem>Analysis</asp:ListItem>
                                        <asp:ListItem>Testing</asp:ListItem>
                                        <asp:ListItem>Network Managment</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                    </div>
                                   </div>
                           <br>
                            <%--<div class="row">
                                <label class="col-lg-2 control-label">Description</label>
                                <div class="col-lg-6">
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <%--<asp:TextBox id="txtDes" runat="server" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>
                                </div>
                            </div>--%>
                            
                            <div class="row">
                                <label class="col-lg-2 control-label">Start Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox id="txtSdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                                </div>
                                    <asp:Label ID="lbls" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>

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
                                    <asp:Label ID="lble" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>

                                    </div>
                            </div>
                            <br>

                             <%--<div class="row">
                                <label class="col-lg-2 control-label">Task Status</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-star"></i></span> 
                                   <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>
                                     <asp:TextBox id="TextBox2" runat="server"  CssClass="form-control" Height="35px" Visible="false"></asp:TextBox>
                                </div>
                                    </div>
                            </div>
                            <br />--%>

                             <div class="row">
                                <label class="col-lg-2 control-label">Task Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox id="TextBox7" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                                </div>
                                    <asp:Label ID="lblt" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                                   
                                    </div>
                            </div>
                          
                           <%-- <div class="row">
                                <label class="col-lg-2 control-label">Employee</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-user"></i></span> 
                                    <%--<input type="text" class="form-control" id="c-name" placeholder=" ">--%>
                                   <%-- <asp:DropDownList ID="DropDownEmp"  CssClass="form-control" runat="server" Height="35px"></asp:DropDownList>
                                </div>
                            </div>
                                </div>--%>
                            <br>

                                  
                      
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click1" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                    <br>
                                    
                                    </div>
                                </div>
                                    <div class="row">
                                     <div class="col-lg-2 col-lg-10">
                                         <h1>Manage Task</h1>
                                    
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TaskId" OnRowCancelingEdit ="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating" BackColor="#CCCCCC" BorderColor="Gray" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                            <Columns>
                                                <asp:TemplateField HeaderText="TaskId">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("TaskId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("TaskId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Employee">
                                                    <EditItemTemplate>
                                                        <%--<asp:DropDownList ID="DropDownList4" runat="server">--%>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                                      
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="ProjectName">
                                                    <EditItemTemplate>
                                                        <%--<asp:DropDownList ID="DropDownList2" runat="server">
                                                        <%--</asp:DropDownList>--%>
                                                        <asp:Label ID="Lbl" runat="server" Text='<%# Bind("ProjectNameAll") %>'></asp:Label>

                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("ProjectNameAll") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TaskName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TaskName") %>' Height="16px" Width="88px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("TaskName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="StartDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("StartDate","{0:dd/MM/yyyy}") %>' Height="16px" Width="88px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("StartDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EndDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EndDate","{0:dd/MM/yyyy}") %>' Width="87px"></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("EndDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TaskStatus">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Lb" runat="server" Text='<%# Bind("TaskStatus") %>'></asp:Label>
                                                       
                                                         <%--<asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("TaskStatus") %>'></asp:TextBox>--%>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("TaskStatus") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="TaskDate">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Labe" runat="server" Text='<%# Bind("TaskDate","{0:dd/MM/yyyy}") %>'></asp:Label>

                                                        <%--<asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("TaskDate","{0:dd/MM/yyyy}") %>' Width="91px"></asp:TextBox>--%>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("TaskDate","{0:dd/MM/yyyy}") %>'></asp:Label>
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
</asp:Content>

