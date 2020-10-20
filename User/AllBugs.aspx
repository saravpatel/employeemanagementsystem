<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="AllBugs.aspx.cs" Inherits="User_AllBugs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="row">

  <div class="col-lg-offset-9">
      <span class="icon"><i></i></span>
      <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/img/search-icon.jpg" OnClick="ImageButton1_Click"/>
      <asp:TextBox ID="TextBox7" runat="server" placeholder="Search...."></asp:TextBox>  
      <%--<input type="search" id="search" placeholder="Search..." />--%>
  </div>
</div>
                            <br>
                            <br />
                            
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <h1>Manage Bugs</h1>
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  DataKeyNames="BugId" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating1" BackColor="#CCCCCC" BorderColor="Gray" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="BugId">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("BugId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BugId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="BugName">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("BugName") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BugName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Emp">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label9" runat="server" Text='<%# Bind("EmpId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Task">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("TaskId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("TaskName") %>'></asp:Label>
                                                    </ItemTemplate>

                                                    <HeaderStyle ForeColor="White" />

                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="BugDate">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label11" runat="server" Text='<%# Bind("BugDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("BugDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="solution">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Solution") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Solution") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="True" ButtonType="Button" >
                                                <ControlStyle CssClass="btn-success" />
                                                <ItemStyle Wrap="False" />
                                                </asp:CommandField>
                                                <asp:CommandField ShowDeleteButton="True" ButtonType="Button" >
                                                <ControlStyle CssClass="btn-danger" />
                                                <ItemStyle Wrap="False" />
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

