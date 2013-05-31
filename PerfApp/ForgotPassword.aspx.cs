using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.EntityModel;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Net.Mime;
namespace PerfApp
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = db.Employee_t.Where(m => m.Email == emailAddress.Text);
                    Employee_t employee = null;

                    if (query.Count() != 0)
                    {
                        employee = query.Single();
                        employee.Password = RandomString(6);
                        employee.PwdReset = 1;
                        db.SaveChanges();
                        MailMessage mail = new MailMessage();
                        var fromAddress = "iggugan@gmail.com";// Gmail Address from where you send the mail
                        mail.To.Add(emailAddress.Text);
                        const string fromPassword = "Veenag18";//Password of your gmail address
                        mail.Subject = "Password Reset Request";
                        mail.IsBodyHtml = true;
                        mail.Body = "<html><body><h1 align=\"left\"><img src=\"cid:image1\" /></h1><br/><h2 align=\"left\"><b>Password Reset</b></font></h2><br/>Dear " + employee.Firstname + ",<br/><br/>We received a request to reset the password associated with this e-mail address. If you made this request, then the new password is  " + employee.Password + ".<br/><br/> Click <a href=\"http://localhost:51848/Login.aspx\">here</a> to login.<br/><br/>If you did not request to have your password reset you can safely ignore this email. Rest assured your account is safe.</font></p></body></html>";
                        mail.From = new MailAddress("iggugan@gmail.com");
                        AlternateView av =AlternateView.CreateAlternateViewFromString(mail.Body, null, MediaTypeNames.Text.Html);
                        LinkedResource lr = new LinkedResource("E:\\trans.jpg", MediaTypeNames.Image.Jpeg);
                        lr.ContentId = "image1";
                        av.LinkedResources.Add(lr);
                        mail.AlternateViews.Add(av); 
                        var smtp = new System.Net.Mail.SmtpClient();
                        {
                            smtp.Host = "smtp.gmail.com";
                            smtp.Port = 587;
                            smtp.EnableSsl = true;
                            smtp.DeliveryMethod = System.Net.Mail.SmtpDeliveryMethod.Network;
                            smtp.Credentials = new NetworkCredential(fromAddress, fromPassword);
                            smtp.Timeout = 20000;
                        }
                        smtp.Send(mail);
                            lblError.Text = "Password is sent to your Email Address.";
                    }
                    else
                    {
                        lblError.Text = "Invalid Email Address";
                    }

                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "ForgotPassword";
                    log.Method = "btnSend_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                }

            }
        }

        private string RandomString(int size)
        {
            try
            {
                StringBuilder builder = new StringBuilder();
                Random random = new Random();
                char ch;
                for (int i = 0; i < size; i++)
                {
                    ch = Convert.ToChar(Convert.ToInt32(Math.Floor(26 * random.NextDouble() + 65)));
                    builder.Append(ch);
                }

                return builder.ToString();
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;

                    log.Page = "ForgotPassword";
                    log.Method = "RandomString";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx", false);
                    return "";
                }

            }
        }
    }
}