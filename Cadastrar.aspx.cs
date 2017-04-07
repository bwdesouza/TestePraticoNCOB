using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btCadastrar_Click(object sender, EventArgs e)
    {
        var Descricao = txtDescrição.Text;
        var idUsuCad = txtIdUsuCad.Text != "" ? Int32.Parse(txtIdUsuCad.Text) : 0;
        //DateTime dtCad = txtDtCad.Text != "" ? DateTime.Parse(txtIdUsuCad.Text) : DateTime.Now;
        var excluido = Int32.Parse(rblExcluido.SelectedValue.ToString());
        var idUsuExc = txtIdUsuExclu.Text != "" ? Int32.Parse(txtIdUsuExclu.Text) : 0;
        DateTime? dtAtual = excluido == 1 ? DateTime.Now : dtAtual = null;

        string constr = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
        using (MySqlConnection con = new MySqlConnection(constr))
        {
            try
            {
                con.Open();
                MySqlCommand comm = con.CreateCommand();
                comm.CommandText = @"INSERT INTO grupo_lojas_b(descricao,idusucad,excluido,dtexcluido,idusuexcluido)
                                VALUES(@descricao, @idusucad, @excluido, @dtexcluido, @idusuexcluido)";
                comm.Parameters.AddWithValue("@descricao", Descricao);
                comm.Parameters.AddWithValue("@idusucad", idUsuCad);
                comm.Parameters.AddWithValue("@excluido", excluido);
                comm.Parameters.AddWithValue("@dtexcluido", dtAtual);
                comm.Parameters.AddWithValue("@idusuexcluido", idUsuExc);
                comm.ExecuteNonQuery();
            }
            catch
            { }
            finally
            { 
                con.Close();
            }
        }
    }
}