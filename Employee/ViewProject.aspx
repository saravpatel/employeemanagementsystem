<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="ViewProject.aspx.cs" Inherits="Employee_ViewProject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .abc {
            color:white;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
            
              
                                    <br>
                                    <h1>View Project</h1>
                                    
                                        
                            <asp:GridView ID="GridView1" runat="server" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" BackColor="#CCCCCC" ForeColor="Black">
                                 <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" CssClass="abc" />
                                            <PagerStyle     ForeColor="Black" HorizontalAlign="Left" BackColor="#CCCCCC" />
                                            <RowStyle BackColor="White" />
                                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                            <SortedAscendingHeaderStyle BackColor="#808080" />
                                            <%--<SortedDescendingCellStyle BackColor="#CAC9C9" />--%>
                                            <%--<SortedDescendingHeaderStyle BackColor="#383838" />--%>

                                 <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                 <SortedDescendingHeaderStyle BackColor="#383838" />

                            </asp:GridView>

                                     </div>
                                

                            </div>

                            
                       
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

