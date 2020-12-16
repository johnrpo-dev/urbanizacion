using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CEntidades;
using CReglas_Negocio;
using System.Data;
using System.Windows.Forms;


namespace urbanizacion
{
    public partial class frmUrbanizacion : System.Web.UI.Page
    {
        CEntApto oentapto = new CEntApto();
        CRegApto oregapto = new CRegApto();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNum.Focus();
            }

        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            if (txtNum.Text.Trim() == "")
            {
                lblMensaje.Text = "Digite el numero de Apartamento";
                txtNum.Focus();
            }
            else
            {
                lblMensaje.Text = "";
                DataSet ds = new DataSet();
                oentapto.Num_apto = txtNum.Text;
                ds = oregapto.consultar_apto(oentapto);
                if (ds.Tables[0].Rows.Count == 0)
                {
                    lblMensaje.Text = "Apartamento No Registrado";
                    txtNum.Focus();
                }
                else
                {
                    lblMensaje.Text = "Apartamento Registrado";
                    txtMetros.Text = ds.Tables[0].Rows[0]["metros"].ToString();
                    txtValor.Text = ds.Tables[0].Rows[0]["valor"].ToString();
                    txtNum.Focus();

                }
            }
        }
        protected void limpiar_datos()
        {
            txtNum.Text = "";
            txtMetros.Text = "";
            txtValor.Text = "";
            txtNum.Focus();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtNum.Text.Trim() == "")
            {
                lblMensaje.Text = "Numero de Apartamento Requerido";
                txtNum.Focus();
            }
            else
            {
                if (txtMetros.Text.Trim() == "")
                {
                    lblMensaje.Text = "Metros Cuadrados Requerido";
                    txtMetros.Focus();
                }
                else
                {
                    if (txtValor.Text.Trim() == "")
                    {
                        lblMensaje.Text = "Valor del Apartamento Requerido";
                        txtValor.Focus();
                    }
                    else
                    {
                        oentapto.Num_apto = txtNum.Text;
                        oentapto.Metros = txtMetros.Text;
                        oentapto.Valor = txtValor.Text;
                        if (oregapto.guardar_apto(oentapto))
                        {
                            lblMensaje.Text = "Registro Guardado";
                            limpiar_datos();
                        }
                        else
                        {
                            lblMensaje.Text = "Error Guardando Registro";
                        }
                    }
                }
            }
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            limpiar_datos();
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Desea Eliminar Este Registro?", "Eliminar Registro",
            MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
            {
                oentapto.Num_apto = txtNum.Text;
                if (oregapto.eliminar_apto(oentapto))
                {
                    lblMensaje.Text = "Registro Eliminado";
                    limpiar_datos();
                }
                else
                {
                    lblMensaje.Text = "Error Eliminando Registro";
                }
            }
        
        }
    }
}