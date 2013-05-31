using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;
using System.Data.Entity.Validation;

namespace PerfApp
{
    public partial class Performance_Appraisal : System.Web.UI.Page
    {
        public Appraisal_t appraisal = null;
        public List<Employee_t> emp = null;
        public int type = 0;
        public int empId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                emp = Session["Employee"] as List<Employee_t>;
                Role_t role = new Role_t();
                if (emp != null)
                {
                    if (Session["Type"] != null)
                    {
                        type = Convert.ToInt32(Session["Type"].ToString());
                    }

                    if (emp[0].PwdReset == 1)
                        Response.Redirect("~/ResetPassword.aspx",false);


                    
                    if (!Page.IsPostBack)
                    {
                        if (type == 1 || type == 2)
                        {
                            int empId = Convert.ToInt32(Request.QueryString["EmpId"].ToString());
                            using (PerformanceAppEntities db = new PerformanceAppEntities())
                            {
                                Session["Firstname"] = emp[0].Firstname;
                                Session["Lastname"] = emp[0].Lastname;
                                //Getting the Reviewer or the appraiser object backup..
                                Session["Employee_Bckup"] = Session["Employee"];
                                emp = db.Employee_t.Where(m => m.Emp_Id == empId).ToList();
                                Session["Employee"] = emp;
                            }
                        }
                        using (PerformanceAppEntities db = new PerformanceAppEntities())
                        {
                            if (Session["Type"] != null)
                            {
                                if (type == 1)
                                {
                                    FromTextBox.Enabled = false;
                                    ToTextBox.Enabled = false;
                                    Responsibility.Enabled = false;
                                    Understanding.Enabled = false;

                                }
                                else if (type == 2)
                                {
                                    FromTextBox.Enabled = false;
                                    ToTextBox.Enabled = false;
                                    Responsibility.Enabled = false;
                                    Understanding.Enabled = false;
                                }
                                else if (type == 0)
                                {

                                }


                            }
                            empId = emp[0].Emp_Id;
                            var query = db.Appraisal_t.Where(m => m.EmpId == empId).ToList();
                            if (query.Count() != 0)
                                appraisal = query.Single();
                            Guid roleId = emp[0].RoleId ?? Guid.Empty;
                            role = db.Role_t.Where(m => m.RoleId == roleId).Single();
                            Session["Role"] = role;
                            Role.Text = role.Name;
                            if (appraisal != null)
                                Session["appraisal"] = appraisal;
                        }

                        if (appraisal != null)
                        {

                            FromTextBox.Text = appraisal.From.Value.ToString("dd-MM-yyyy");
                            ToTextBox.Text = appraisal.To.Value.ToString("dd-MM-yyyy");
                            Responsibility.Text = appraisal.Responsibility;
                            Understanding.Text = appraisal.Understanding;

                        }

                        NameTextBox.Text = emp[0].Firstname + "" + emp[0].Lastname;
                        if (type == 0)
                            name.Text = emp[0].Firstname + "&nbsp;" + emp[0].Lastname;
                        else
                            name.Text = Session["Firstname"].ToString() + "&nbsp;" + Session["Lastname"].ToString();
                        DateofJoiningTextBox.Text = emp[0].Dateofjoining.Value.ToString("dd-MM-yyyy");
                        using (PerformanceAppEntities db1 = new PerformanceAppEntities())
                        {
                            if (emp[0].Appraiser != null)
                            {
                                int appr = emp[0].Appraiser ?? 0;
                                Employee_t app = db1.Employee_t.Where(m => m.Emp_Id == appr).Single();
                                AppraiserTextBox.Text = app.Firstname + "" + app.Lastname;
                            }
                            else
                                AppraiserTextBox.Text = "";
                            if (emp[0].Reviewer != null)
                            {
                                int revr = emp[0].Reviewer ?? 0;
                                Employee_t rev = db1.Employee_t.Where(m => m.Emp_Id == revr).Single();
                                ReviewerTextBox.Text = rev.Firstname + "" + rev.Lastname;
                            }
                            else
                                ReviewerTextBox.Text = "";
                        }

                        if (appraisal == null)
                        {
                            FromTextBox.Text = DateTime.Now.ToString("dd-MM-yyyy");
                            ToTextBox.Text = DateTime.Now.AddDays(30).ToString("dd-MM-yyyy");
                        }

                    }

                }
                else
                    Response.Redirect("~/Login.aspx",false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal";
                    log.Method = "Page_Load";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
           }

        protected void logout_Click(object sender, EventArgs e)
        {
            try
            {
                Session.Remove("Employee");
                if (Session["appraisal"] != null)
                    Session.Remove("appraisal");
                Response.Redirect("~/Login.aspx?logout=1",false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal";
                    log.Method = "logout_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }

        }

        protected void Next_Click(object sender, EventArgs e)
        {
            try
            {
                Session["Understanding"] = Understanding.Text;
                Session["Responsibility"] = Responsibility.Text;
                Session["From"] = FromTextBox.Text;
                Session["To"] = ToTextBox.Text;
                //Save();
                Response.Redirect("~/PerformanceAppraisal3.aspx?type=" + type.ToString(),false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal";
                    log.Method = "Next_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        protected void BtnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
                Session["isSaved"] = 1;
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    var query = db.Appraisal_t.Where(m => m.EmpId == empId);

                    if (query.Count() != 0)
                    {
                        Appraisal_t app_raisal = query.Single();
                        app_raisal.Status = 1;
                        db.SaveChanges();
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal";
                    log.Method = "BtnSave_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
          }

        protected void BtnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal";
                    log.Method = "BtnSubmit_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        public void Save()
        {
            try
            {
                Session["Understanding"] = Understanding.Text;
                Session["Responsibility"] = Responsibility.Text;
                Session["From"] = FromTextBox.Text;
                Session["To"] = ToTextBox.Text;
                using (PerformanceAppEntities db1 = new PerformanceAppEntities())
                {
                    Appraisal_t appraisals = new Appraisal_t();
                    if (appraisal != null)
                    {
                        int empId = emp[0].Emp_Id;
                        appraisals = db1.Appraisal_t.Where(m => m.EmpId == empId).Single();
                    }
                    else
                        appraisals.AppId = Guid.NewGuid();
                    appraisals.EmpId = emp[0].Emp_Id;
                    //appraisals.EmpProjects = Session["EmpProjectId"] as String;
                    //appraisals.EmpSkills = Empskills;
                    //appraisals.SelfOverall = SelfAssessment0.SelectedValue;
                    //appraisals.AssessorOverAll = AssessorRating0.SelectedValue;
                    //appraisals.FinalOverAll = FinalizedRating.SelectedValue;
                    //appraisals.RecPromotion = RecommendedforPromotion0.Text;
                    //appraisals.NotPromoting = notpromoting0.Text;
                    appraisals.DoAssessment = DateTime.Parse("1753-01-01 00:00:00");
                    appraisals.DoAssessmentDisc = DateTime.Parse("1753-01-01 00:00:00");
                    appraisals.DoAssessorCompletion = DateTime.Parse("1753-01-01 00:00:00");
                    appraisals.DoFinalization = DateTime.Parse("1753-01-01 00:00:00");
                    appraisals.Understanding = Session["Understanding"] as String;
                    appraisals.Responsibility = Session["Responsibility"] as String;
                    appraisals.From = Convert.ToDateTime(Session["From"] as String);
                    appraisals.To = Convert.ToDateTime(Session["To"] as String);
                    //appraisals.Weightage = Weightage0.Text;
                    if (appraisal == null)
                        db1.Appraisal_t.Add(appraisals);
                    db1.SaveChanges();
                    Session["appraisal"] = appraisals;
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal";
                    log.Method = "Save";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }


    }
}