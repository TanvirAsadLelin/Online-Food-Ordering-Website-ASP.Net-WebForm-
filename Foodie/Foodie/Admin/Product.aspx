<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="Foodie.Admin.Product" %>

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


    <script>
        function ImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=imgProduct.ClientID %>').prop('src', e.target.result)
                        .width(200)
                        .height(200);
                };
                reader.readAsDataURL(input.files[0]);

            }
        }
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pcoded-inner-content pt-0">
        <div class="align-align-self-end">
            <asp:Label ID="lblMsg" runat="server" Visible="false"></asp:Label>
        </div>

        <div class="main-body">
            <div class="page-wrapper">

                <div class="page-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="card">
                                <div class="card-header">
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-sm-6 col-md-4 col-lg-4">
                                            <h4 class="sub-title">Product</h4>
                                            <div>
                                                <div class="form-group">
                                                    <label>Product Name</label>
                                                    <div>
                                                        <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Name"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                            ErrorMessage="Name is requried" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtProductName"></asp:RequiredFieldValidator>
                                                        <asp:HiddenField ID="hdnId" runat="server" Value="0" />
                                                    </div>
                                                </div>

                                                   <div class="form-group">
                                                    <label>Product Description</label>
                                                    <div>
                                                        <asp:TextBox ID="txtProductDescription" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Description" TextMode="MultiLine"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                            ErrorMessage="Description is requried" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                                            ControlToValidate="txtProductDescription"></asp:RequiredFieldValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Price(BDT)</label>
                                                    <div>
                                                        <asp:TextBox ID="txtProductPrice" runat="server" CssClass="form-control"
                                                            placeholder="Enter Product Price"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                                            ErrorMessage="Price is requried" ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                                            ControlToValidate="txtProductPrice"></asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                                            ErrorMessage="Price must be in decimal." ForeColor="Red" Display="Dynamic" SetFocusOnError="true" 
                                                            ControlToValidate="txtProductPrice" ValidationExpression="^(\d+(\.\d+)?)$"></asp:RegularExpressionValidator>
                                                    </div>
                                                </div>

                                                <div class="form-group">
                                                    <label>Product Image</label>
                                                    <div>
                                                        <asp:FileUpload ID="fuProductImage" runat="server" CssClass="form-control"
                                                            onchange="ImagePreview(this);" />
                                                    </div>
                                                </div>
                                                <div class="form-check pl-4">
                                                    <asp:CheckBox ID="chkIsActive" runat="server" Text="&nbsp; IsActive"
                                                        CssClass="form-check-input" />
                                                </div>

                                                <div class="pb-5">
                                                    <asp:Button ID="btnAddOrUpdate" runat="server" Text="Add" CssClass="btn btn-primary"
                                                        OnClick="btnAddOrUpdate_Click" />
                                                    &nbsp;
                                                   
                                                    <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-primary" CausesValidation="false"
                                                        OnClick="btnClear_Click" />

                                                </div>

                                                <div>
                                                    <asp:Image ID="imgProduct" runat="server" CssClass="img-thumbnail" />
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-sm-6 col-md-8 col-lg-8">
                                            <h4 class="sub-title">Product List</h4>

                                            <div class="card-block table-border-style">
                                                <div class="table-responsive">
                                                    <asp:Repeater ID="rProduct" runat="server" OnItemCommand="rProduct_ItemCommand"
                                                        OnItemDataBound="rProduct_ItemDataBound">
                                                        <HeaderTemplate>
                                                            <table class="table data-table-export table-hover nowrap">
                                                                <thead>


                                                                    <tr>
                                                                        <th class="table-plus">Name</th>
                                                                        <th>Image</th>
                                                                        <th>IsActive</th>
                                                                        <th>Create Date</th>
                                                                        <th class="datatable-nosort">Action</th>
                                                                    </tr>
                                                                </thead>
                                                                <tbody>
                                                        </HeaderTemplate>

                                                        <ItemTemplate>
                                                            <tr>
                                                                <td class="table-plus"><%# Eval("Name") %></td>
                                                                <td>
                                                                    <img alt="" width="40" src="<%# Utils.GetImageUrl( Eval("ImageUrl")) %>" />
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="lblIsActive" runat="server" Text='<%# Eval("IsActive") %>'></asp:Label>
                                                                </td>
                                                                <td><%# Eval("CreateDate") %></td>
                                                                <td>
                                                                    <asp:LinkButton ID="lnkEdit" runat="server" Text="Edit" CssClass="badge badge-primary"
                                                                        CommandArgument='<%# Eval("ProductId") %>' CommandName="edit">
                                                                        <i class="ti-pencil"></i>

                                                                    </asp:LinkButton>

                                                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete" CssClass="badge bg-danger"
                                                                        CommandArgument='<%# Eval("ProductId") %>' CommandName="delete"
                                                                        OnClientClick="return confirm('Do you want to delete this Product?');">
                                                                        <i class="ti-trash"></i>

                                                                    </asp:LinkButton>
                                                                </td>

                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            </tbody>
                                                            </table>
                                                       
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
