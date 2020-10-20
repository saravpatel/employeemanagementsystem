<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage2.master" AutoEventWireup="true" CodeFile="ForgotPass.aspx.cs" Inherits="ForgotPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<script src="js/jquery-ui-1.10.4.min.js"></script>
  <link href="../loginpage/style1.css" rel="stylesheet" />--%>
     <link rel="stylesheet" href="http://localhost:49396/maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
<link href='http://fonts.googleapis.com/css?family=Varela+Round' rel='stylesheet' type='text/css'/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.13.1/jquery.validate.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1" />
 

    <link href="caa.css" rel="stylesheet" />
    <script src="javascript.js"></script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   <br />

<div class="text-center">
	<div class="logo" style="font-family: Georgia, 'Times New Roman', Times, serif; font-size: x-large; font-weight: bold; color: #FFFFFF; text-decoration: underline;">Forgot password</div>
	<!-- Main Form -->
	<div class="login-form-1">
		<form id="forgot-password-form" class="text-left">
			<div class="etc-login-form">
				<p style="font-family: Arial, Helvetica, sans-serif; font-size: small; color: #FFFFFF; font-weight: bold">When you fill in your registered email address, you will be sent instructions on how to reset your password.</p>
			</div>
			<div class="login-form-main-message"></div>
			<div class="main-login-form">
				<div class="login-group">
					<div class="form-group">
						<label for="fp_email" class="sr-only">Email address</label>
                        <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="Email address"></asp:TextBox>
						<%--<input type="text" class="form-control" id="fp_email" name="fp_email" placeholder="email address">--%>
					</div>
				</div>
<asp:Button ID="Button1" runat="server" class="login-button" Text="Send"  BorderColor="#808080" OnClick="Button1_Click"/><i class=""></i>
				<%--<button type="submit" class="login-button"></button>--%>
			</div>
			<div class="etc-login-form">
				<p style="font-weight: bold; font-size: small; font-family: Arial, Helvetica, sans-serif; color: #FFFFFF;">Already have an account? <b><a href="login.aspx">Login here</a></b>
</p>
				<p style="font-weight: bold; font-size: small; font-family: Arial, Helvetica, sans-serif; color: #FFFFFF;">New user? <b><a href="login.aspx">Create new account</a></b>
</p>
			</div>
		</form>
	</div>
	<!-- end:Main Form -->
</div> 
    
    
    
    <%--<div class="form" height="60%" width="50%">
        <div class="page-header">
            <div id="login">   
       
          
            <div class="field-wrap">
            <label>
              Email Address<span class="req">*</span>
            </label>
            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
          </div>
          
          </div>
          
                  
      
          
     

        </div>
        </div>
    </div>--%>
    
</asp:Content>

