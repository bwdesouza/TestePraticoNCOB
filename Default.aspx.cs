using System;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Data;
using System.Configuration;

public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnExportar_Click(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        using (MySqlConnection con = new MySqlConnection(constr))
        {
            using (MySqlCommand cmd = new MySqlCommand(@"select contrato, p.num_parcelas,VLR_PARCELA,vlr_pago,dt_pagamento
                                                        from contratos c
                                                        join parcelas p on p.idcontrato = c.id
                                                        where p.ativo = 1
                                                        and p.dt_pagamento between @dataini and @datafim", con))
            {
                using (MySqlDataAdapter sda = new MySqlDataAdapter())
                {
                    var dtIni = DateTime.Parse(txtDataIni.Text);
                    var dtFim = DateTime.Parse(txtDataFim.Text);
                    cmd.Connection = con;
                    cmd.Parameters.AddWithValue("dataini", String.Format("{0:yyyy/MM/dd HH:mm:ss}", dtIni));
                    cmd.Parameters.AddWithValue("datafim", String.Format("{0:yyyy/MM/dd HH:mm:ss}", dtFim));
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        //preenche o datatable
                        sda.Fill(dt);

                        //Constroi os dados do arquivo texto
                        string txt = string.Empty;

                        //percorre o datatable
                        foreach (DataRow row in dt.Rows)
                        {
                            foreach (DataColumn column in dt.Columns)
                            {
                                //Inclui as linhas de dados
                                txt += row[column.ColumnName].ToString() + "; ";
                            }
                            //Nova linha
                            txt += "\r\n";
                        }

                        var dataAtual = DateTime.Now;
                        var nomeArq = "PAGAMENTOS_" + String.Format("{0:dd_MM_yyyy}", dataAtual) + ".txt";

                        //Faz o Download do arquivo texto
                        Response.Clear();
                        Response.Buffer = true;
                        Response.AddHeader("content-disposition", "attachment;filename="+ nomeArq );
                        Response.Charset = "";
                        Response.ContentType = "application/text";
                        Response.Output.Write(txt);
                        Response.Flush();
                        Response.End();
                    }
                }
            }
        }
    }
}