<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AMasterPage.master" AutoEventWireup="true" CodeFile="CompanyTypeId.aspx.cs" Inherits="Admin_CompanyTypeId" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Manage Company Type</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Company Type</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-users"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                     <asp:TextBox id="txtctname" runat="server" CssClass="form-control" ></asp:TextBox>
                                </div>
                                    <asp:Label ID="Label4" runat="server" Text="Please Enter The type first" ForeColor="Red" Font-Bold="True"></asp:Label>

                                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtctname" ErrorMessage="Enter Type first..!!" ForeColor="Red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                <%--<ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="txtctname" FilterType="Custom" />--%>

                            </div>
                                </div>
                            <br>
                            
                            
                           
                            <%--<div class="row">
                                <label class="col-lg-2 control-label">State Id</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-users"></i></span> 
                                    <%--<input type="text" class="form-control" id="c-name" placeholder=" ">--%>
                                    <%--<asp:DropDownList ID="DropDownStateid"  CssClass="form-control" runat="server" Height="35px"></asp:DropDownList>
                                </div>
                                    </div>
                            </div>--%>
                            <br>
                          
                          <br>
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click1"/>
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                   <br />
                                    <h1>All Company Type</h1>
                                    <div class="row">
                                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="CompanyTypeId" AutoGenerateColumns="False" Height="16px" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating1" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black" >
                                            <Columns>
                                                <asp:TemplateField HeaderText="Company type Id">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("companytypeId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("companytypeId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                    <ItemStyle HorizontalAlign="Center" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Company type">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("companytype") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("companytype") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:CommandField ShowEditButton="True" ButtonType="Button" >
                                                <ControlStyle BorderStyle="Dashed" CssClass="btn-success" />
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

