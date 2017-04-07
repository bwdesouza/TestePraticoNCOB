<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.9.0/themes/base/jquery-ui.css" />
    <script src="http://code.jquery.com/jquery-1.8.2.js"></script>
    <script src="http://code.jquery.com/ui/1.9.0/jquery-ui.js"></script>

    <div class="row">
        <div class="jumbotron">
            <h2>Exportar arquivo texto.</h2>
            <p>
                Escolha uma data inícial e uma data final para exportar.
            </p>
            <p>
                <asp:Label ID="lbDataIni" runat="server" ClientIDMode="Static" Text="Data início" Width="19%"></asp:Label>

                <asp:Label ID="lbDataFim" runat="server" ClientIDMode="Static" Text="Data Fim"></asp:Label>
            </p>
            <p>
                <asp:TextBox ID="txtDataIni" runat="server" ClientIDMode="Static" Width="19%"></asp:TextBox>

                <asp:TextBox ID="txtDataFim" runat="server" ClientIDMode="Static" Width="19%"></asp:TextBox>
            </p>
            <p>
                <asp:Button ID="btnExportar" runat="server" ClientIDMode="Static" Text="Exportar" OnClick="btnExportar_Click" />
            </p>
        </div>
    </div>

<script type="text/javascript">
    $(function () {
    $.datepicker.setDefaults($.datepicker.regional["br"]);
    $("#txtDataIni").datepicker({
        dateFormat: 'dd/mm/yy',
        dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
        dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom']
    });
    $("#txtDataFim").datepicker({
        dateFormat: 'dd/mm/yy',
        dayNamesMin: ['D', 'S', 'T', 'Q', 'Q', 'S', 'S', 'D'],
        dayNamesShort: ['Dom', 'Seg', 'Ter', 'Qua', 'Qui', 'Sex', 'Sáb', 'Dom']
    });
    
    $("#txtDataIni").change(function () {
        let data = $("#txtDataIni").val();
        $("#txtDataIni").val(data + " 00:00:00");
    });

    $("#txtDataFim").change(function () {
        let data = $("#txtDataFim").val();
        $("#txtDataFim").val(data + " 23:59:59");
    });
});
</script>
</asp:Content>
