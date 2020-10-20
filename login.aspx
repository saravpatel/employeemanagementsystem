<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      


<script src="js/jquery-ui-1.10.4.min.js"></script>
  <link href="../loginpage/style1.css" rel="stylesheet" />
   <%-- <script src="js/index.js"></script>--%>
</asp:Content>
 
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 
    <div class="form" height="60%" width="50%">
      
      <ul class="tab-group">
        
        <li class="tab active"><a href="#login">Log In</a></li>
          <li class="tab"><a href="#signup">Sign Up</a></li>
      </ul>
      
      <div class="tab-content">

          <div id="login">   
       
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <asp:TextBox ID="TextBox5" runat="server" MaxLength="30"></asp:TextBox>
                <asp:Label ID="Label4" runat="server" Text="Email Id Must be required" ForeColor="White" Font-Bold="True"></asp:Label>
                <%--<asp:RequiredFieldValidator runat="server" ID="reqName" ControlToValidate="TextBox5" ErrorMessage="Email Id Must be required" ForeColor="White" Font-Bold="True"></asp:RequiredFieldValidator>--%>
          </div>
          
          <div class="field-wrap">
            <label>
              Password<span class="req">*</span>
            </label>
            <asp:TextBox ID="TextBox6" runat="server" TextMode="Password" MaxLength="10"></asp:TextBox> 
                   <%--<asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/show_hide_password-07-256.png" style="height: 36px;width: 50px; margin-top: -37px;  float: right;" OnClick="ImageButton1_Click"/>--%>
              <asp:Label ID="Label5" runat="server" Text="Please Enter the Password" ForeColor="White" Font-Bold="True"></asp:Label>
              <%--<asp:RequiredFieldValidator runat="server" ID="pass" ControlToValidate="TextBox6" ErrorMessage="Password Must be between 6-12 Character" ForeColor="White" Font-Bold="True"></asp:RequiredFieldValidator>--%>
          </div>
          
              <div class="bounceOutDown">
          
                  <asp:DropDownList ID="DropDownList4" runat="server" Height="35px" Width="520px">
                      <asp:ListItem>System Admin</asp:ListItem>
                      <asp:ListItem>Admin</asp:ListItem>
                      <asp:ListItem>Employee</asp:ListItem>
                  
                  </asp:DropDownList>
          </div>
            <br />
            <asp:Label ID="Label2" runat="server" Text="*Incorrect Email or Password " Visible="False" ForeColor="#1AB188"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="*Please Select the Catogory " Visible="False" ForeColor="#1AB188"></asp:Label>
<br />
          <p class="forgot"><a href="ForgotPass.aspx">Forgot Password?</a></p>
            <br />
          
         <asp:Button ID="Button2" runat="server"  CssClass="button button-block" Text="Log In" OnClick="Button2_Click" />
          


     
        </div>


        <div id="signup">   
          
       
          
          <div class="top-row">
            <div class="field-wrap">
              <label>
                Comapny Name<span class="req">*</span>
              </label>
              <asp:TextBox ID="TextBox1" runat="server" Width="520px" MaxLength="20"></asp:TextBox>
            </div>
        </div>
            <br/>
            <br/>
            <div class="field-wrap">
              <label>
                Address<span class="req">*</span>
              </label>
             <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" MaxLength="50"></asp:TextBox>
            </div>
      
                 <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                      <ContentTemplate>
                          <div class="field-wrap">
              <label>
                <span class="req"></span>
              </label>
              
                           <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Height="35px" Width="520px"></asp:DropDownList>

                              </div>

            <div class="field-wrap">
              <label>
                <span class="req"></span>
              </label>
                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Height="35px" Width="520px"></asp:DropDownList>
             <%--<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>--%>
            </div>
                      </ContentTemplate>
                  </asp:UpdatePanel>
                 
             <%--<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>--%>
            

            <div class="field-wrap">
              <label>
                Mobile No<span class="req">*</span>
              </label>
             <asp:TextBox ID="TextBox9" runat="server" MaxLength="12"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="TextBox9" FilterType="Numbers" />
            </div>


             <div class="field-wrap">
              <label>
                Phone<span class="req">*</span>
              </label>
             <asp:TextBox ID="TextBox10" runat="server" MaxLength="10"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender2" runat="server" TargetControlID="TextBox10" FilterType="Numbers" />

            </div>
            

             <div class="field-wrap">
              <label>
                Fax No<span class="req">*</span>
              </label>
             <asp:TextBox ID="TextBox11" runat="server"  MaxLength="10"></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender3" runat="server" TargetControlID="TextBox11" FilterType="Numbers" />

            </div>

              <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
      <asp:TextBox ID="TextBox3" runat="server" MaxLength="50"></asp:TextBox>
          </div>

           <div class="field-wrap">
              <label>
                Website<span class="req">*</span>
              </label>
             <asp:TextBox ID="TextBox12" runat="server" MaxLength="20" ></asp:TextBox>
            </div>
          
               <div class="field-wrap">
              <label>
                <span class="req"></span>
              </label>
        <asp:FileUpload ID="FileUpload1" runat="server" />
            </div>
            

          <div class="field-wrap">
            <label>
              Employee strength<span class="req">*</span>
            </label>
            <asp:TextBox ID="TextBox4" runat="server"  TextMode ="Number" ></asp:TextBox>
                <ajaxToolkit:FilteredTextBoxExtender ID="FilteredTextBoxExtender4" runat="server" TargetControlID="TextBox4" FilterType="Numbers" />

          </div>
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                      <ContentTemplate>
              <div class="field-wrap">
            <label>
              <span class="req"></span>
            </label>
                  
                          <asp:DropDownList ID="DropDownList3" runat="server" Height="35px" Width="520px"></asp:DropDownList>
                    
                  
          </div>  

                      </ContentTemplate>
                  </asp:UpdatePanel>

            <div class="field-wrap">
            <label>
              Password<span class="req">*</span>

            </label>
            <asp:TextBox ID="TextBox7" runat="server"  TextMode ="Password" MaxLength="12"></asp:TextBox>
                <ajaxToolkit:PasswordStrength ID="PasswordStrength1" runat="server" TextCssClass="danger" TargetControlID="TextBox7" MinimumLowerCaseCharacters="2" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" />
          </div>
          
            <asp:Label ID="Label1" runat="server" Text="*you have already Registed" ForeColor="Red"></asp:Label>

        <asp:Button ID="Button1" runat="server"  CssClass="button button-block" Text="Submit" OnClick="Button1_Click" />
          
     

        </div>
        
        
        
      </div><!-- tab-content -->
</div>
    <!--Start of Zendesk Chat Script-->
<!--Start of Zendesk Chat Script-->
<script type="text/javascript">
    window.$zopim || (function (d, s) {
        var z = $zopim = function (c) { z._.push(c) }, $ = z.s =
        d.createElement(s), e = d.getElementsByTagName(s)[0]; z.set = function (o) {
            z.set.
            _.push(o)
        }; z._ = []; z.set._ = []; $.async = !0; $.setAttribute("charset", "utf-8");
        $.src = "https://v2.zopim.com/?4kOMfyZvwegST6I7GFVXoRVjM7r7Sefi"; z.t = +new Date; $.
        type = "text/javascript"; e.parentNode.insertBefore($, e)
    })(document, "script");
</script>
<!--End of Zendesk Chat Script--><!--End of Zendesk Chat Script-->

</asp:Content>

