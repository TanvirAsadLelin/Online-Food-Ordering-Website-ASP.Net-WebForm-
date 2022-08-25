<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Foodie.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
       <script type="text/javascript">  
        window.onload = function () {
            var seconds = 5;
            setTimeout(function () {
                document.getElementById("<%=lblMsg.ClientID %>").style.display = "none";
            }, seconds * 1000);
        };
    </script>


    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgUserImage.ClientID %>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);

            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <section class="book_section layout_padding">
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">

                    <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
                </div>
                <asp:Label ID="lblHeaderMsg" runat="server" Text="<h2>User Registration</h2>"></asp:Label>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="form_container">
                        <div>
                            <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Enter full name." ToolTip="Full Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvFullName" runat="server" ErrorMessage="Name is requried!" ControlToValidate="txtFullName" ForeColor="Red"
                                SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revFullName" runat="server" ErrorMessage="Name must be in characters only." ForeColor="Red"
                                SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtFullName">

                            </asp:RegularExpressionValidator>
                        </div>

                        <div>
                            <asp:TextBox ID="txtUserName" runat="server" CssClass="form-control" placeholder="Enter  Username." ToolTip="Username"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Username is requried!" ControlToValidate="txtUserName" ForeColor="Red"
                                SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>



                        <div>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="Enter  Email." ToolTip="Email"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="Email is requried!" ControlToValidate="txtEmail" ForeColor="Red"
                                SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="Please enter  valid email." ForeColor="Red"
                                SetFocusOnError="true" Display="Dynamic" ValidationExpression="^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$" ControlToValidate="txtEmail">

                            </asp:RegularExpressionValidator>

                        </div>


                        <div>
                            <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control"
                                placeholder="Enter mobile number" ToolTip="Mobile number" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvMobile" runat="server"
                                ErrorMessage="Mobile number is requried" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                ControlToValidate="txtMobile"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revMobile" runat="server"
                                ErrorMessage="Mobile number must have 11 digits." ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                ControlToValidate="txtMobile" ValidationExpression="^[0-9]{11}$"></asp:RegularExpressionValidator>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">

                        <div>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Enter address." ToolTip="Address" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ErrorMessage="Address is requried!" ControlToValidate="txtAddress" ForeColor="Red"
                                SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>

                        </div>

                        <div>
                            <asp:TextBox ID="txtPostCode" runat="server" CssClass="form-control" placeholder="Enter post/zip code." ToolTip="Post/Zip code" TextMode="Number"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPostCode" runat="server" ErrorMessage="Post/Zip code is requried!" ControlToValidate="txtPostCode" ForeColor="Red"
                                SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revPostCode" runat="server"
                                ErrorMessage="Post/Zip code must have 4 digits." ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                ControlToValidate="txtPostCode" ValidationExpression="^[0-9]{4}$"></asp:RegularExpressionValidator>

                        </div>



                        <div>
                            <asp:FileUpload ID="fuUserImage" runat="server" CssClass="form-control" ToolTip="User image" onchange="ImagePreview(this);" />
                        </div>


                        <div>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"
                                placeholder="Enter mobile number" ToolTip="Mobile number" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                                ErrorMessage="Password is requried" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                            
                        </div>
                    </div>

                </div>

                <div class="row pl-4">
                    <div class="btn-box">
                        <asp:Button ID="btnRegister" runat="server" Text="Register" CssClass="btn btn-success rounded-pill pl-4 pr-4 text-white" />
                        <asp:Label ID="lblAleradyUser" runat="server" CssClass="pl-3 text-black-100" 
                            Text="Already registered?<a href='Login.aspx' class='badge badge-info'>Login here..</a>"></asp:Label>
                    </div>
                </div>    
            </div>
        </div>
    </section>

</asp:Content>
