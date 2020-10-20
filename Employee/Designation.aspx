<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="Designation.aspx.cs" Inherits="Employee_Designation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Designation</h1>

                            
                            <br>
                      
                            
                                    <div class="col-lg-5">
                                   <asp:GridView ID="GridView2" runat="server" DataKeyNames="DegId" AutoGenerateColumns="False" CellPadding="4" ForeColor="Black" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellSpacing="2">

                                         <Columns>
                                           <asp:TemplateField HeaderText="DesignationId">
                                               <EditItemTemplate>
                                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("DegId") %>'></asp:Label>
                                               </EditItemTemplate>
                                               <ItemTemplate>
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("DegId") %>'></asp:Label>
                                               </ItemTemplate>
                                               <ItemStyle HorizontalAlign="Center" />
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Designation">
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Designation") %>'></asp:TextBox>
                                               </EditItemTemplate>
                                               <ItemTemplate>
                                                   <asp:Label ID="Label3" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                     
                                            </Columns>  
                                       
                                         <FooterStyle BackColor="#CCCCCC" />
                                         <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                                         <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Center" />
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
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

