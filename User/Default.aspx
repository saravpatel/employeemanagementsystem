<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="User_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        table th{
            text-align:center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

   <form id="Form1" name="f1" runat="server">
        <div style="width: 100%; height=100%; border: 2px solid black;" ></diV>
        <br />
        <br />

            <div style="margin: auto; border-style: solid; border-color: #000000; width: 30%; height: 250px; float: left; background-repeat: repeat; font-family: 'Arial Rounded MT Bold'; background-image: url('http://localhost:49396/backgroung.jpg');">
        <h1 style="font-family: Georgia, 'Times New Roman', Times, serif; font-weight: bold; color: #FFFFFF; text-decoration: underline;">All News</h1>        
                <asp:Panel ID="Panel1" runat="server">
                     <marquee direction="up" scrolldelay="3" scrollamount="1"onmouseover="this.stop();" onmouseout="this.start();">
                                <asp:repeater id="rep" runat="server">
                                  <Itemtemplate>
                                    <asp:Label runat="server" ID="msg"  Text='<%# Bind("News") %>' Font-Bold="True" ForeColor="Black"></asp:Label></td>
                                      <br>
                                     
                                  </Itemtemplate>
                                    </asp:repeater>
                         </marquee>
                    </asp:Panel><br /><br /><br /><br /><br />
                         <div style="margin:auto; border-style: solid; border-color: #000000; width: 100%; height: 230px; float: left; background-repeat: repeat; font-family: 'Arial Rounded MT Bold'; background-image: url('http://localhost:49396/backgroung.jpg');">
                                   <h5><u style="font-family: Arial, Helvetica, sans-serif; color: #FFFFFF; font-size: x-large; font-weight: bold">Upcoming Birthday's of employee</u></h5>
                             <asp:Panel ID="Panel2" runat="server">    
                     <marquee direction="up" scrolldelay="2" scrollamount="1" onmouseover="this.stop();"  onmouseout="this.start();">
                             <asp:repeater id="Rptdob" runat="server">
                                  <Itemtemplate>
                                    
   [<asp:Label runat="server" ID="msgid"  Text='<%# Bind("EmpId") %>' Font-Bold="True" ForeColor="Black"></asp:Label>]
                    
                                 
   <asp:Label runat="server" ID="msgdob"  Text='<%# Bind("FName") %>' Font-Bold="True" ForeColor="Black"></asp:Label>
                                       <asp:Label runat="server" ID="Lb"  Text='<%# Bind("Dob") %>'   Font-Bold="True" ForeColor="Black"></asp:Label>
  
                                      <br>
  
                                     </br>
                                  </Itemtemplate>
                                    </asp:repeater>
                                
   
                     </marquee>
                </asp:Panel>
                </div>
</div>            
            <div style="width: 67%; height: auto; float:right;">
                <center>  <label class="col-lg-pull-1 control-label" style="font-family: 'Arial Rounded MT Bold'; font-size: 30px; font-weight: bolder; color: #0000FF">View Events</label></center>
                <asp:Calendar ID="Calendar1" runat="server" NextPrevFormat="ShortMonth" Height="380px" OnDayRender="Calendar1_DayRender" Width="642px" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black">
                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                    <DayStyle BackColor="#CCCCCC" HorizontalAlign="Center" />
                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                    <OtherMonthDayStyle ForeColor="#999999" />
                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                </asp:Calendar>
                </div>
        
    </form>


</asp:Content>

