<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="ManageDesignation.aspx.cs" Inherits="User_ManageDesignation" %>

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
                                <label class="col-lg-2 control-label">Designation</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-briefcase"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                     <asp:TextBox id="txtDesi" runat="server"  CssClass="form-control" ></asp:TextBox>
                                           </div>
                                          <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtDesi" ErrorMessage="* Enter proper designation" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                               
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

                                    <h1>Grid View</h1>
                                    <div class="row">
                                   <asp:GridView ID="GridView1" runat="server" DataKeyNames="DegId" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating" Height="47px" Width="165px" BackColor="#CCCCCC" BorderColor="Gray" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                       
                                 
                                       <Columns>
                                           <asp:TemplateField HeaderText="DesignationId">
                                               <EditItemTemplate>
                                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("DegId") %>'></asp:Label>
                                               </EditItemTemplate>
                                               <ItemTemplate>
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("DegId") %>'></asp:Label>
                                               </ItemTemplate>
                                               <HeaderStyle ForeColor="White" />
                                               <ItemStyle HorizontalAlign="Center" />
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Designation">
                                               <EditItemTemplate>
                                                   <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Designation") %>'></asp:TextBox>
                                               </EditItemTemplate>
                                               <ItemTemplate>
                                                   <asp:Label ID="Label3" runat="server" Text='<%# Bind("Designation") %>'></asp:Label>
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
                      <%--                     <asp:TemplateField HeaderText="Action">
                                               <EditItemTemplate>
                         <i class="btn btn-check" > 
                          <i class="icon_check_alt2"></i>
                                 <asp:LinkButton ID="LinkButton_Edit" runat="server"  CommandName="Update"  >
                                     

                                 </asp:LinkButton>
                          </i>
                          
                      <i class="btn btn-danger">  
                           <i class="icon_check_alt2"></i>
                           <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandName="Delete" >
                              

                           </asp:LinkButton>
                          </i>
                    
                    </EditItemTemplate>
                                                <ItemTemplate>
                      <i class="btn btn-primary" > 
                          <i class="icon_plus_alt2"></i>
                                 <asp:LinkButton ID="LinkButton_Edit" runat="server"  CommandName="Edit" OnClick="LinkButton_Edit_Click" CommandArgument='<%# Bind("DegId") %>' >
                                     

                                 </asp:LinkButton>
                          </i>
                          
                      <i class="btn btn-success">  
                           <i class="icon_check_alt2"></i>
                           <asp:LinkButton ID="LinkButton_Delete" runat="server" CommandName="Delete">
                              

                           </asp:LinkButton>
                          </i>
                    </ItemTemplate>
                                           </asp:TemplateField>
                                       </Columns>--%>
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
    </form>
</asp:Content>

