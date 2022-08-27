<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Foodie.User.Login" %>
<%@ Import Namespace="Foodie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <script type="text/javascript">  
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
      </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
      <div class="container">
          <div class="heading_container">
              <div class="align-self-end">
                  <asp:Label ID="lblMsg" runat="server"></asp:Label>
              </div>
              <h2>Login</h2>
          </div>
          <div class="row">
              <div class="col-md-6">
                  <div class="form_container">
                      <img id="userLogin" src="../Images/login.jpg" alt="" class="img-thumbnail" />
                  </div>
              </div>
                   <div class="col-md-6">
                  <div class="form_container">
                      <div>
                         
                      <asp:RequiredFieldValidator ID="rfvUsername" runat="server" ErrorMessage="Username is requried" ForeColor="Red" 
                       ControlToValidate="txtUsername" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                           <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter username"></asp:TextBox>
                      </div>

                      <div>
                          
                      <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ErrorMessage="Password is requried" ForeColor="Red" 
                       ControlToValidate="txtPassword" Display="Dynamic" SetFocusOnError="true" Font-Size="Small"></asp:RequiredFieldValidator>
                          <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                      </div>

                      <div class="btn-box">
                        <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" OnClick="btnLogin_Click"/>
                            <span class="pl-3 text-info">New user?<a href="#" class="badge badge-info">Registration here..</a></span>
                          </div>
                      
                  </div>

                   
                      
                        
                      
                  
              </div>
          </div>
      </div>

  </section>
</asp:Content>
