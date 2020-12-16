<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmUrbanizacion.aspx.cs" Inherits="urbanizacion.frmUrbanizacion" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Urbanizacion</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous"/>
    <style type="text/css">
        .auto-style1 {
            width: 103%;
            max-width: 1000px;
            margin-left: auto;
            margin-right: 20px;
            padding-left: var(--bs-gutter-x, .75rem);
            padding-right: var(--bs-gutter-x, .75rem);
            height: 428px;
            margin-top: 65px;
        }
        .auto-style2 {
            width: 271px;
        }
        .auto-style3 {
            width: 187px;
        }
        .auto-style5 {
            width: 142px;
        }
        .auto-style6 {
            width: 18px;
        }
        .auto-style7 {
            width: 92%;
            max-width: 1000px;
            margin-left: auto;
            margin-right: 20px;
            padding-left: var(--bs-gutter-x, .75rem);
            padding-right: var(--bs-gutter-x, .75rem);
        }
    </style>
</head>
<body background="img/fondo1.jpg" style="margin-left: 190; width: 1064px;">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand"> Urbanizacion Cantabria</a>
      </div>
    </nav>    
    <div class="auto-style1">
    <center>
    <h1 class="align-content-center" style="color:brown"><b>CRUD Apartamentos</b></h1>
    </center>
        <div class="justify-content-center">
            <form class="mt-5" id="form1" runat="server">
                <div>
                    <table class="auto-style7">
                        <tr>
                            <td class="auto-style2" style="color:darkkhaki"><b> NUMERO DE APARTAMENTO</b></td>
                            <td class="auto-style6">
                                <asp:RequiredFieldValidator ID="rfvNum" runat="server" ControlToValidate="txtNum" ErrorMessage="*" Font-Size="XX-Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtNum" runat="server" MaxLength="3" TextMode="Number" Width="166px" CssClass="offset-sm-0"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RegularExpressionValidator ID="revNum" runat="server" ControlToValidate="txtNum" ErrorMessage="Maximo 3 Digitos" Font-Size="Medium" ForeColor="#FFFF66" SetFocusOnError="True" ValidationExpression="[1-9][0-9][0-9]"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:Button class="btn btn-danger" ID="btnEliminar" runat="server" OnClick="btnEliminar_Click" Text="Eliminar" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="color:darkkhaki"><b> METROS CUADRADOS</b></td>
                            <td class="auto-style6">
                                <asp:RequiredFieldValidator ID="rfvMetros" runat="server" ControlToValidate="txtMetros" ErrorMessage="*" Font-Size="XX-Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtMetros" runat="server" MaxLength="2" TextMode="Number" Width="165px"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RegularExpressionValidator ID="revMetros" runat="server" ControlToValidate="txtMetros" ErrorMessage="Maximo 2 Digitos" Font-Size="Medium" ForeColor="#FFFF66" SetFocusOnError="True" ValidationExpression="[1-9][0-9]"></asp:RegularExpressionValidator>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2" style="color:darkkhaki"><b>VALOR DEL APARTAMENTO</b></td>
                            <td class="auto-style6">
                                <asp:RequiredFieldValidator ID="rfvValor" runat="server" ControlToValidate="txtValor" ErrorMessage="*" Font-Size="XX-Large" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                            </td>
                            <td class="auto-style3">
                                <asp:TextBox ID="txtValor" runat="server" MaxLength="7" TextMode="Number" Width="165px"></asp:TextBox>
                            </td>
                            <td class="auto-style5">
                                <asp:RegularExpressionValidator ID="revValor" runat="server" ControlToValidate="txtValor" ErrorMessage="Maximo 7 Digitos" Font-Size="Medium" ForeColor="#FFFF66" SetFocusOnError="True" ValidationExpression="[1-9][0-9][0-9][0-9][0-9][0-9][0-9]"></asp:RegularExpressionValidator>
                            </td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Label ID="lblMensaje" runat="server" Font-Size="X-Large" ForeColor="Red"></asp:Label>
                            </td>
                            <td class="auto-style6">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style5">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Button class="btn btn-light btn-sm" ID="btnGuardar" runat="server" OnClick="btnGuardar_Click" Text="Guardar" />
                            </td>
                            <td class="auto-style6">
                                &nbsp;</td>
                            <td class="auto-style3">
                                <asp:Button CausesValidation="false" class="btn btn-light btn-sm" ID="BtnBuscar" runat="server" OnClick="BtnBuscar_Click" Text="Buscar" />
                            </td>
                            <td class="auto-style5">&nbsp;</td>
                            <td>
                                <asp:Button CausesValidation="false" class="btn btn-secondary" ID="btnLimpiar" runat="server" OnClick="btnLimpiar_Click" Text="Limpiar" />
                            </td>
                        </tr>
                    </table>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
