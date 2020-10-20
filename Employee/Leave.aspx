<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="Leave.aspx.cs" Inherits="Employee_Leave" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Manage Leave</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Leave Reason</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-file-text"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                     <asp:TextBox id="txtLreason" runat="server" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>
                                </div>
                                           <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtLreason" ErrorMessage="* Write your leave reason" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>
                                     
                            </div>
                                </div>
                            <br>
                            
                            <div class="row">
                                <label class="col-lg-2 control-label">Leave Date</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox id="txtLdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                                </div>
                            </div>
                                </div>
                            <br>

                             <div class="row">
                                <label class="col-lg-2 control-label">Start Leave Date</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                    <asp:TextBox id="txtStartLdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                            </div>
                                            <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtStartLdate" ErrorMessage="* This field is required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>
                               
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">End Leave Date</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtEndLdate" runat="server" TextMode="Date" CssClass="form-control" Height="35px"></asp:TextBox>
                               </div>
                                           <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator3" ControlToValidate="txtEndLdate" ErrorMessage="* This field is required" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>
                                           
                                    </div>
                                </div>
                            <br>
                            
                            <div class="row">
                                <%--<label class="col-lg-2 control-label">Status</label>--%>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <%--<span class="input-group-addon"><i class="fa fa-check"></i></span>--%> 
                                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" AutoPostBack="true" Visible="false">
                                            <asp:ListItem>Approve</asp:ListItem>
                                            <asp:ListItem> Not Approve</asp:ListItem>
                                        </asp:DropDownList>
                                </div>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click1" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <br>
                                    <h1>Grid View</h1>
                                    <div class="row">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="LeaveId" Height="105px" Width="785px" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" Font-Bold="False" ForeColor="Black">
                                            <Columns>
                                                <asp:TemplateField HeaderText="LeaveId">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("LeaveId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <FooterStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="LeaveReason">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("LeaveReason") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("LeaveReason") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="LeaveDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LeaveDate","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("LeaveDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="StartLeaveDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("StartLeaveDate","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("StartLeaveDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EndLeaveDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("EndLeaveDate","{0:dd/MM/yyyy}") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("EndLeaveDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="LeaveStatus">
                                                    <EditItemTemplate>
                                           <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true">
                                            <asp:ListItem>Approve</asp:ListItem>
                                            <asp:ListItem> Not Approve</asp:ListItem>
                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("LeaveStatus") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EmpName">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="ddle" runat="server" AutoPostBack="true"></asp:DropDownList>
                                                    </EditItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <FooterStyle BackColor="#CCCCCC" />
                                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
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
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

