<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="AllProject.aspx.cs" Inherits="User_AllProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">


                            
                            <br />

                            <div class="row">
                                <label class="col-lg-2 control-label">Project Name</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-star"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                     <asp:TextBox id="txtpname" runat="server"  CssClass="form-control" ></asp:TextBox>
                                          
                                </div>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtpname" ErrorMessage="* Please enter the project name" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>
                            </div>
                                </div>     
                            <br />
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <br>
                                    <br />
                                    <h1>All Project</h1>
                                    <div class="row">
                                   <asp:GridView ID="GridView1" runat="server" DataKeyNames="PId" AutoGenerateColumns="False"  Height="47px" Width="165px" BackColor="#CCCCCC" BorderColor="Gray" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                                       
                                 
                                       <Columns>
                                           <asp:TemplateField HeaderText="ProjectId">
                                               <EditItemTemplate>
                                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("PId") %>'></asp:Label>
                                               </EditItemTemplate>
                                               <ItemTemplate>
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("PId") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle ForeColor="White" />
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="ProjectName">
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProjectNameAll") %>'></asp:TextBox>
                                               </EditItemTemplate>
                                               <ItemTemplate>
                                                   <asp:Label ID="Label3" runat="server" Text='<%# Bind("ProjectNameAll") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle ForeColor="White" />
                                           </asp:TemplateField>
                                           <asp:CommandField ShowEditButton="True" ButtonType="Button"  >
                                           <ControlStyle CssClass="btn-success"/>
                                           <ItemStyle Wrap="False" />
                                           </asp:CommandField>
                                           <asp:CommandField ShowDeleteButton="True" ButtonType="Button">
                                           <ControlStyle CssClass="btn-danger" />
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
    </form>
</asp:Content>

