﻿<%@ Page Title="" Language="C#" MasterPageFile="~/User/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Foodie.User.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                            <asp:TextBox ID="txtUserName"  runat="server" CssClass="form-control" placeholder="Enter full name." ToolTip="Full Name"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="Name is requried!" ControlToValidate="txtUserName" ForeColor="Red" 
                                SetFocusOnError="true" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="revUserName" runat="server" ErrorMessage="Name must be in characters only!" ForeColor="Red" 
                                SetFocusOnError="true" Display="Dynamic" ValidationExpression="^[a-zA-Z\s]+$" ControlToValidate="txtUserName"></asp:RegularExpressionValidator>
                        </div>

                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form_container">

                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
