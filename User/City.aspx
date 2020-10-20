<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="City.aspx.cs" Inherits="User_City" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <form id="Form1" name="f1" runat="server">
    <div class="panel">
        <div class="panel-body bio-graph-info">
            <h1>Manage City</h1>

            <div class="row">
                <label class="col-lg-2 control-label">City Name</label>
                <div class="col-lg-6">
                        <div class="input-group margin-bottom-sm">
                    <span class="input-group-addon"><i class="fa fa-file-text"></i></span> 
                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                        <asp:TextBox id="txtCity" runat="server"  CssClass="form-control" ></asp:TextBox>
                                  </div>
              <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtCity" ErrorMessage="* Enter city name" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                        
            </div>
                
                </div>
            <br />

            <div class="row">
                <label class="col-lg-2 control-label">State Id</label>
                <div class="col-lg-6">
                        <div class="input-group margin-bottom-sm">
                    <span class="input-group-addon"><i class="fa fa-users"></i></span> 
                    <%--<input type="text" class="form-control" id="c-name" placeholder=" ">--%>
                    <asp:DropDownList ID="DropDownStateid"  CssClass="form-control" runat="server" Height="35px" AutoPostBack="True"></asp:DropDownList>
                </div>
                    </div>
            </div>
                       <br />
               
            <div class="row">
                <div class="col-lg-offset-2 col-lg-10">
                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click1" />
                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" />
                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                    <br>
                    <br />
                    <h1>Grid View</h1>
                    <div class="row">
                        <asp:GridView ID="GridView1" runat="server" DataKeyNames="CityId" AutoGenerateColumns="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                            <Columns>
                                <asp:TemplateField HeaderText="CityId">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("CityId") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("CityId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="White" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="CityName">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CityName") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("CityName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="White" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="StateName">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                                        </asp:DropDownList>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <HeaderStyle ForeColor="White" />
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" ButtonType="Button" >
                                <ControlStyle CssClass="btn-success" />
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

