<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="GanrateCharts.aspx.cs" Inherits="Employee_GanrateCharts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    Ganrate Charts

    <form id="form1" runat="server">
   
        <br />
        <div class="row">
        <div class="col-lg-3">
            
        <asp:Chart ID="Chart2" runat="server" BackColor="128, 64, 0" BackGradientStyle="TopBottom"  
        BorderlineWidth="0" Height="340px" Palette="None" PaletteCustomColors="64, 0, 0"  
        Width="360px" BorderlineColor="192, 64, 0" >  
        <Series>  
            <asp:Series Name="Percentage"  YValuesPerPoint="12" XValueMember="ProjectName" YValueMembers="No_of_days">  
            </asp:Series>  
        </Series>  
        <ChartAreas>  
            <asp:ChartArea Name="ChartArea1">  
                <AxisX Title="Month" TitleAlignment="Center"></AxisX>
                 <AxisY Title="Percentage" TitleAlignment="Center"></AxisY>
                  
            </asp:ChartArea>  
        </ChartAreas> 
            <Legends>
                <asp:Legend Name="Legend1" Title="PojectCompletation"></asp:Legend>
                <asp:Legend Name="Legend2" Title="Month"></asp:Legend>

            </Legends> 
    </asp:Chart>  
    </div>
       
         <div class="col-lg-offset-6">
    <asp:Chart ID="Chart1" runat="server" BackColor="64, 0, 0"   
        BackGradientStyle="LeftRight" Height="340px" Palette="None"   
        PaletteCustomColors="192, 0, 0" Width="360px">  
        <Series>  
            <asp:Series Name="Series1" ChartType="Line" YValuesPerPoint="12">  
            </asp:Series>  
        </Series>  
        <ChartAreas>  
            <asp:ChartArea Name="ChartArea1" >  
                 <AxisX Title="Month" TitleAlignment="Center"></AxisX>
                 <AxisY Title="Percentage" TitleAlignment="Center" TitleForeColor="White"></AxisY>
            </asp:ChartArea>  
        </ChartAreas>  
        <Legends>
                <asp:Legend Name="Legend1" Title="PojectCompletation"></asp:Legend>
                <asp:Legend Name="Legend2" Title="Month"></asp:Legend>

            </Legends> 
        <BorderSkin BackColor="" PageColor="192, 64, 0" />  
    </asp:Chart>  
  
    </div>
        <br />
    </div>
          <br />
        <div class="row">
            <div class="col-lg-4">
        <asp:Chart ID="Chart3" runat="server">
            <Series>
                <asp:Series Name="Series9" ChartType="Pie" XValueMember="ProjectName" YValueMembers="No_Of_Days"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                </asp:ChartArea>
            </ChartAreas>
        </asp:Chart>
              <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectManagementConnectionString %>" SelectCommand="SELECT * FROM [ProjectMaster] WHERE ([EmpId] = @EmpId)">
                  <SelectParameters>
                      <asp:SessionParameter Name="EmpId" SessionField="EmpId" Type="Int32" />
                  </SelectParameters>
              </asp:SqlDataSource>--%>
    </div>

       
          <div class="col-lg-offset-6">
        <asp:Chart ID="Chart4" runat="server">
            <Series>
                <asp:Series Name="Series9" ChartType="Column" XValueMember="ProjectName" YValueMembers="No_Of_Days"></asp:Series>
            </Series>
            <ChartAreas>
                <asp:ChartArea Name="ChartArea1">
                    <AxisX Title="Month" TitleAlignment="Center"></AxisX>
                 <AxisY Title="Percentage" TitleAlignment="Center"></AxisY>
                </asp:ChartArea>

            </ChartAreas>
        </asp:Chart>
              <%--<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ProjectManagementConnectionString %>" SelectCommand="SELECT * FROM [ProjectMaster] WHERE ([EmpId] = @EmpId)">
                  <SelectParameters>
                      <asp:SessionParameter Name="EmpId" SessionField="EmpId" Type="Int32" />
                  </SelectParameters>
              </asp:SqlDataSource>--%>
    </div>
        </div>
    </form>
</asp:Content>

