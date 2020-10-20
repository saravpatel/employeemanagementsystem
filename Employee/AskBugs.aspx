<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="AskBugs.aspx.cs" Inherits="User_AskBugs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Ask Bugs</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Bug Name(Type)</label>
                                <div class="col-lg-6">
                                       <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-bug"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtBname" runat="server" CssClass="form-control" ></asp:TextBox>
                                           </div>
                                            <asp:RequiredFieldValidator runat="server" ID="txtBname1" ControlToValidate="txtBname" ErrorMessage="* Write proper bug name in detail" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>
                                
                                    </div>
                            </div>
                            <br>

                            
                            <div class="row">
                                <label class="col-lg-2 control-label">Bug Date</label>
                                <div class="col-lg-6">
                                       <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox id="txtBdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                            </div>
                            <br>

                            <%--<div class="row">
                                <label class="col-lg-2 control-label">Employee Id</label>
                                <div class="col-lg-6">
                                       <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-user"></i></span> 
                                  <asp:DropDownList ID="DropDownEmpBug" CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    </div>
                            </div>--%>
                            <br>
                             <div class="row">
                                <label class="col-lg-2 control-label">Task Name</label>
                                <div class="col-lg-6">
                                       <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-tasks"></i></span> 
                                    <%--<input type="text" class="form-control" id="c-name" placeholder=" ">--%>
                                    <asp:DropDownList ID="DropDownTaskBug"  CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    </div>
                            </div>
                            <br>


                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<asp:Button ID="Button2" runat="server"  CssClass="btn btn-primary" Text="Save" />--%>                                  
                                    <%--<asp:Button ID="btncel" runat="server"  CssClass="btn btn-danger" Text="Cancel" />--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click1" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                   <br />

                                     <h1>Ask bugs</h1>
                                    <div class="col-lg-7">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                            <Columns>
                                                <asp:TemplateField HeaderText="BugId">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("BugId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("BugId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="BugName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("BugName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("BugName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Employee">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="DropDownList1" runat="server">
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("FName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Task">
                                                    <EditItemTemplate>
                                                        <asp:DropDownList ID="DropDownList2" runat="server">
                                                        </asp:DropDownList>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("TaskName") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Solution">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Solution") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Solution") %>'></asp:Label>
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
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

