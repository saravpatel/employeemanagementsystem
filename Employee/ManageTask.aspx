<%@ Page Title="" Language="C#" MasterPageFile="~/Employee/MasterPage.master" AutoEventWireup="true" CodeFile="ManageTask.aspx.cs" Inherits="Employee_ManageTask" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="Form1" name="f1" runat="server">
       <%-- <div id="container" class="">
            <div id="main-content">
                <div class="wrapper">--%>
                    <div class="panel">
                        <div class="panel-body bio-graph-info">
                            <h1>Manage Task</h1>

                            <div class="row">
                                <label class="col-lg-2 control-label">Task Name</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-tasks"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:DropDownList ID="DropDownProject"  CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    </div>
                            </div>
                            <br>

                            <div class="row">
                                <label class="col-lg-2 control-label">Employee Id</label>
                                <div class="col-lg-6">
                                     <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                    <%--<input type="text" class="form-control" id="c-name" placeholder=" ">--%>
                                    <asp:DropDownList ID="DropDownEmp"  CssClass="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    </div>
                             </div>
                            <br> 
                          <div class="row">
                                <label class="col-lg-2 control-label">Start Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                     <asp:TextBox id="txtSdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                              </div>
                            <br>

                             <div class="row">
                                <label class="col-lg-2 control-label">End Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                   <%-- <textarea name="" id="" class="form-control" cols="30" rows="5"></textarea>--%>
                                    <asp:TextBox id="txtEdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                            </div>
                                 </div>
                            <br>
                            <div class="row">
                                <label class="col-lg-2 control-label">Task Date</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-calendar"></i></span> 
                                    <%--<input type="text" class="form-control" id="f-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtPdate" runat="server" TextMode="Date" CssClass="form-control"></asp:TextBox>
                                </div>
                                    </div>
                                </div>
                            <br>
                           <div class="row">
                                <label class="col-lg-2 control-label">Status</label>
                                <div class="col-lg-6">
                                    <div class="input-group margin-bottom-sm">
                                  <span class="input-group-addon"><i class="fa fa-check"></i></span> 
                                    <%--<input type="text" class="form-control" id="l-name" placeholder=" ">--%>
                                    <asp:TextBox id="txtDes" runat="server" TextMode="MultiLine" CssClass="form-control" ></asp:TextBox>
                                </div>
                            </div>
                               </div>
                            <br>
 
                           

                                  
                      
                          
                            <div class="row">
                                <div class="col-lg-offset-2 col-lg-10">
                                    <%--<button type="submit" class="btn btn-primary">Save</button>--%>
                                    <%--<button type="button" class="btn btn-danger">Cancel</button>--%>
                                    <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" Text="Save" />
                                    <asp:Button ID="Button2" runat="server" CssClass="btn btn-danger" Text="Cancel" OnClick="Button2_Click" />
                                    <br>
                                </div>

                            </div>

                            
                        </div>
                    </div>
             <%--   </div>
            </div>
        </div>--%>
    </form>
</asp:Content>

