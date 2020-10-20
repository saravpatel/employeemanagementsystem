<%@ Page Title="" Language="C#" MasterPageFile="~/User/MasterPage1.master" AutoEventWireup="true" CodeFile="ViewCharts.aspx.cs" Inherits="User_ViewCharts" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>View Charts</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Employee Name</label>
                                <div class="col-lg-6">
                                      <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-bars"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                          <asp:DropDownList ID="ddc" OnSelectedIndexChanged="ddc_SelectedIndexChanged"  CssClass="form-control" runat="server" Height="35px" AutoPostBack="True"></asp:DropDownList>
                                </div>
                            </div>
                                </div>
                            <asp:Chart ID="Chart4" runat="server" Width="503px">
            <Series>
                <asp:Series Name="No of Month" ChartType="Column" XValueMember="ProjectName" YValueMembers="No_Of_Days"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Month" TitleAlignment="Center"></AxisX>
                 <AxisY Title="Percentage of Work" TitleAlignment="Center"></AxisY>
                </asp:ChartArea>
            </ChartAreas>
                                <Titles>
                                    <asp:Title Alignment="TopCenter" Name="Title1" Text="Work Progress">
                                    </asp:Title>
                                </Titles>
                                <Legends>
                                    <asp:Legend Name="No of Month" Title="User Work"></asp:Legend>
                                </Legends>
        </asp:Chart>
                            </div>

                        </div>

        </form>
</asp:Content>

