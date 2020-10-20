<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="ManageEvent.aspx.cs" Inherits="User_ManageEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="../Scripts/jquery-3.1.1.js"></script>
    <script>
        $(document).ready(function () {
            $("#Button1").click(function () { 
                if ($("#txtEventName").val() == "")
                {
                    alert("Please Enter Event Name.....!");
                }
                if ($("#txtEventDate").val() == "") {
                    alert("Please Enter Event Date.....!");
                }
            });
        });
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="Form1" name="f1" runat="server">
        <%--<div id="container" class="">
            <div id="main-content">
                <div class="wrapper">
        --%>            <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Manage Event</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Event Name</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-list"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox ID="txtEventName" runat="server" class="form-control" placeholder="Enter Event Name"></asp:TextBox>
                                    
                                          </div>
                                    <asp:Label ID="Label2" runat="server" Text="" Font-Bold="True" ForeColor="Red"></asp:Label>
                                    <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" ControlToValidate="txtEventName" ErrorMessage="* Please write the event name" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                    </div>
                                <div class="row">
  <div class="col-lg-20">
      <span class="icon"><i></i></span>
      <asp:ImageButton ID="ImageButton1" runat="server"  ImageUrl="~/img/search-icon.jpg" OnClick="ImageButton1_Click" ValidateRequestMode="Enabled" />
      <asp:TextBox ID="TextBox7" runat="server" placeholder="Search...."></asp:TextBox>  
      <%--<input type="search" id="search" placeholder="Search..." />--%>
  </div>
                                    
</div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Event Date</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtEventDate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                        
                                </div>
                                    <asp:Label ID="Label6" runat="server" Text="" ForeColor="Red" Font-Bold="True"></asp:Label>

                                     <%--<asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" ControlToValidate="txtEventDate" ErrorMessage="* Enter event date" ForeColor="red" Font-Bold="True"></asp:RequiredFieldValidator>--%>
                                    </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" OnClick="Button1_Click1" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                      <br />
                                     <h1>All Events</h1>
                                    <div class="row">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="EventId" OnRowCancelingEdit="GridView1_RowCancelingEdit1" OnRowDeleting="GridView1_RowDeleting1" OnRowEditing="GridView1_RowEditing1" OnRowUpdating="GridView1_RowUpdating1" BackColor="#CCCCCC" BorderColor="Gray" BorderStyle="Solid" BorderWidth="5px" CellPadding="4" CellSpacing="2" ForeColor="Black">
                                            <Columns>
                                                <asp:TemplateField HeaderText="EventId">
                                                    <EditItemTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("EventId") %>'></asp:Label>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("EventId") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EventDate">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventDate") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("EventDate","{0:dd/MM/yyyy}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                    <HeaderStyle ForeColor="White" />
                                                </asp:TemplateField>
                                                <asp:TemplateField HeaderText="EventName">
                                                    <EditItemTemplate>
                                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("EventName") %>'></asp:TextBox>
                                                    </EditItemTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("EventName") %>'></asp:Label>
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
                                            <SortedAscendingHeaderStyle BackColor="Gray" />
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

