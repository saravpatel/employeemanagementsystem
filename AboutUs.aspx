<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script src="js/jquery-ui-1.10.4.min.js"></script>
  <link href="../loginpage/style1.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <table cellspacing="10px" cellpadding="10px;" style="text-align:justify;">
        <tr style="background-color:#fff; font-family:Arial; font-size:15px; ">
            <td rowspan="2">
                <br />
           <br />
                <p> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Project management is the discipline of initiating, planning, executing, controlling, and closing the work of a team to achieve specific goals and meet specific success criteria. ... This information is usually described in a user or project manual, which is created at the beginning of the development process.

A key factor that distinguishes project management from just 'management' is that it has this final deliverable and a finite timespan, unlike management which is an ongoing process. Because of this a project professional needs a wide range of skills; often technical skills, and certainly people management skills and good business awareness.

A project is temporary in that it has a defined beginning and end in time, and therefore defined scope and resources.

And a project is unique in that it is not a routine operation, but a specific set of operations designed to accomplish a singular goal. So a project team often includes people who don’t usually work together – sometimes from different organizations and across multiple geographies.

The development of software for an improved business process, the construction of a building or bridge, the relief effort after a natural disaster, the expansion of sales into a new geographic market — all are projects.

<%--And all must be expertly managed to deliver the on-time, on-budget results, learning and integration that organizations need.

Project management, then, is the application of knowledge, skills, tools, and techniques to project activities to meet the project requirements.

Project managers are the people in charge of a specific project or projects within a company. As the project manager, your job is to plan, budget, oversee and document all aspects of the specific project you are working on. Project managers may work closely with upper management to make sure that the scope and direction of each project is on schedule, as well as other departments for support. Project managers might work by themselves, or be in charge of a team to get the job done.--%>

Project managers can work in a variety of fields, from from technical/IT to human resources, to advertising/marketing to construction and more.</p>
            </td>
            <td>
                <asp:Image ID="Image1" runat="server" ImageUrl="~/about-us.jpg"  Height="450" Width="550" />
            </td>
        </tr>
    </table>
</asp:Content>


