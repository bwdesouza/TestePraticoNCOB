<%@ Page Language="C#" MasterPageFile="~/Site.Master" EnableEventValidation="false" AutoEventWireup="true" CodeFile="Cadastrar.aspx.cs" Inherits="About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
    <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>

    <h2>Cadastro</h2>
    
    <form id="myform">
        <div class="form-group">
            <strong><asp:Label ID="lbDescricao" Font-Size="Medium" ClientIDMode="Static" Text="Descrição" runat="server"></asp:Label></strong>
            <asp:TextBox TextMode="MultiLine" Height="10em" CssClass="form-control" ID="txtDescrição" ClientIDMode="Static" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator id="RequiredFieldValidator1" runat="server"
              ControlToValidate="txtDescrição"
              ErrorMessage="Por favor, digite uma breve descrição"
              ForeColor="Red">
            </asp:RequiredFieldValidator>
        </div>
        <div class="form-group">
            <strong><asp:Label ID="lbIdUsuCad" Font-Size="Medium" ClientIDMode="Static" Text="Cod. usuario cad." runat="server"></asp:Label></strong>
            <asp:TextBox CssClass="form-control" ID="txtIdUsuCad" ClientIDMode="Static" runat="server" MaxLength="11"></asp:TextBox>
        </div>
        <div class="form-group">
            <strong><asp:Label ID="lbDtCad" Font-Size="Medium" ClientIDMode="Static" Text="Data cadastrado" runat="server"></asp:Label></strong>
            <asp:TextBox CssClass="form-control" ID="txtDtCad" ClientIDMode="Static" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <strong><asp:Label ID="lbExcluido" Font-Size="Medium" CssClass="form-check-input" ClientIDMode="Static" Text="Excluido" runat="server"></asp:Label></strong>
            <asp:RadioButtonList ID="rblExcluido" ClientIDMode="Static" runat="server" >
                <asp:ListItem Text="Sim" Value="1"></asp:ListItem>
                <asp:ListItem Text="Não" Value="0" Selected="True"></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        <div class="form-group">
            <strong><asp:Label ID="lbDtExcluido" Font-Size="Medium" ClientIDMode="Static" Text="Data da exclusão" runat="server"></asp:Label></strong>
            <asp:TextBox CssClass="form-control" ID="txtDtExcluido" ClientIDMode="Static" runat="server"></asp:TextBox>
        </div>
        <div class="form-group">
            <strong><asp:Label ID="lbIdUsuExclu" Font-Size="Medium" ClientIDMode="Static" Text="Cod. usuario excluiu" runat="server"></asp:Label></strong>
            <asp:TextBox CssClass="form-control" ID="txtIdUsuExclu" ClientIDMode="Static" runat="server" MaxLength="11"></asp:TextBox>
        </div>
        <div class="form-group">
            <asp:Button ID="btCadastrar" Text="Cadastrar" CssClass="btn btn-primary" runat="server" ClientIDMode="Static" OnClick="btCadastrar_Click" />
            <asp:Button ID="btNovo" Text="Novo" CssClass="btn btn-default" runat="server" ClientIDMode="Static" />
        </div>
    </form>


    <script type="text/javascript">
        $("#rblExcluido").change(function () {
            if ($("#rblExcluido").find(":checked").val() == "1")
                $("#txtIdUsuExclu").prop("disabled", false);
            else
                $("#txtIdUsuExclu").prop("disabled", true);
        });
        
        $("#btNovo").on("click", function () {
            $("#txtDescrição").val("");
            $("#txtIdUsuCad").val("");
            $("#txtDtCad").val("");
            $("#rblExcluido").val(0);
            $("#txtDtExcluido").val("");
            $("#txtIdUsuExclu").val("");    
        });

        function verificaNumero(e) {
            if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
                return false;
            }
        }

        $(document).ready(function () {
            $("#txtDtCad").prop("disabled", true);
            $("#txtDtExcluido").prop("disabled", true);
            $("#txtIdUsuExclu").prop("disabled", true);

            $("#txtIdUsuCad").keypress(verificaNumero);
            $("#txtIdUsuExclu").keypress(verificaNumero);

            $("#txtDescrição").attr('maxlength', '199');
            $("#txtDescrição").attr('minlength', '3');

            $("#txtDescrição").attr("placeholder", "Escreva uma descrição");

        });
    </script>
</asp:Content>
