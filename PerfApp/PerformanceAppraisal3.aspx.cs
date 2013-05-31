using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Entity.Validation;
namespace PerfApp
{
    public partial class PerformanceAppraisal3 : System.Web.UI.Page
    {
        public List<Projects_t> Projects = new List<Projects_t>();
        public List<Skills_t> Skills = new List<Skills_t>();
        public List<int> Rating = null;
        List<Employee_t> emp = null;
        public Appraisal_t appraisal = null;
        public List<EmpSkills_t> empSkills = null;
        List<EmpProject_t> empProject = null;
        Role_t role = null;
        int empId = 0;
        List<Parameter_t> Parameters = new List<Parameter_t>();
        public string[] ProjectIds = null;
        public string[] Project = null;
        List<String> RatingItem = null;
        public int type = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                emp = Session["Employee"] as List<Employee_t>;
                if (emp == null)
                    Response.Redirect("~/Login.aspx",false);
                empId = emp[0].Emp_Id;

                role = Session["Role"] as Role_t;

                appraisal = Session["appraisal"] as Appraisal_t;

                Rating = new List<int>();

                for (int i = 1; i <= 5; i++)
                {
                    Rating.Add(i);
                }

                RatingItem = new List<string>();
                RatingItem.Add("Extraordinary");
                RatingItem.Add("Exemplary +");
                RatingItem.Add("Exemplary");
                RatingItem.Add("Enabler +");
                RatingItem.Add("Enabler");
                appraisal = Session["appraisal"] as Appraisal_t;
                if (Session["Type"] != null)
                {
                    type = Convert.ToInt32(Session["Type"].ToString());

                }
                if (!Page.IsPostBack)
                {
                    //jquery drop
                    ReviewerRating.DataSource = RatingItem;
                    ReviewerRating.DataBind();
                    using (PerformanceAppEntities db = new PerformanceAppEntities())
                    {
                        string[] CriteriaIds = role.CriteriaIds.Split(';');

                        for (int i = 0; i < CriteriaIds.Length; i++)
                        {
                            Guid Id = Guid.Parse(CriteriaIds[i]);
                            Parameter_t Localparameter = db.Parameter_t.Where(m => m.CriteriaId == Id).Single();
                            Parameters.Add(Localparameter);

                        }
                        ProjectGrid.DataSource = Parameters;
                        ProjectGrid.DataBind();
                        if (appraisal != null)
                        {
                            if (appraisal.EmpProjects != null)
                            {
                                ReviewerRating.Text = appraisal.ProRevRating;
                                ReviewerComment.Text = appraisal.ProRevComment;
                                OtherTextBox.Text = appraisal.ProAppOtherCmnt;
                                ProjectIds = appraisal.EmpProjects.Split(';');
                                empProject = new List<EmpProject_t>();
                                for (int t = 0; t < ProjectIds.Length - 1; t++)
                                {
                                    Guid ID = Guid.Parse(ProjectIds[t]);
                                    EmpProject_t empPro = db.EmpProject_t.Where(m => m.EmpProjId == ID).Single();
                                    empProject.Add(empPro);
                                }

                                if (empProject != null)
                                {
                                    int total = 0;
                                    foreach (var item in empProject.OrderBy(order => order.Type))
                                    {
                                        GridViewRow row = ProjectGrid.Rows[total];
                                        if (item.Type == total)
                                        {
                                            DropDownList combo1 = (DropDownList)row.FindControl("SelfRating");
                                            combo1.SelectedValue = item.Self_Rating.ToString();
                                            TextBox text_Self = row.FindControl("SelfComment") as TextBox;
                                            text_Self.Text = item.SelfComments;

                                            DropDownList combo2 = (DropDownList)row.FindControl("AppraiserRating");
                                            combo2.SelectedValue = item.App_Rating.ToString();
                                            TextBox text_App = row.FindControl("AppraiserComment") as TextBox;
                                            text_App.Text = item.AppComments;
                                        }

                                        total++;
                                    }
                                }
                            }

                        }
                    }

                    if (type == 0)
                    {
                        name.Text = emp[0].Firstname + "&nbsp;" + emp[0].Lastname;
                        Reviwer.Visible = false;
                        OtherComments.Visible = false;
                        OtherTextBox.Visible = false;
                    }
                    else
                        name.Text = Session["Firstname"].ToString() + "&nbsp;" + Session["Lastname"].ToString();
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "Page_Load";
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

                string EmpProjectId = "";
                for (int i = 0; i < ProjectGrid.Rows.Count; i++)
                {

                    using (PerformanceAppEntities db = new PerformanceAppEntities())
                    {
                        GridViewRow item = ProjectGrid.Rows[i];
                        int empId = emp[0].Emp_Id;
                        EmpProject_t pro = new EmpProject_t();

                        var query = db.EmpProject_t.Where(m => m.EmpId == empId && m.Type == i);
                        if (query.Count() != 0)
                            pro = query.Single();

                        pro.EmpId = emp[0].Emp_Id;
                        DropDownList combo_Self = item.FindControl("SelfRating") as DropDownList;
                      pro.Self_Rating = combo_Self.SelectedValue;
                        TextBox text_Self = item.FindControl("SelfComment") as TextBox;
                        pro.SelfComments = text_Self.Text;
                        DropDownList combo_App = item.FindControl("AppraiserRating") as DropDownList;
                        pro.App_Rating = combo_App.SelectedValue;
                        TextBox text_App = item.FindControl("AppraiserComment") as TextBox;
                        pro.AppComments = text_App.Text;
                        if (query.Count() == 0)
                            pro.EmpProjId = Guid.NewGuid();
                        EmpProjectId += pro.EmpProjId.ToString() + ";";
                        pro.Type = i;
                        if (query.Count() == 0)
                        {

                            db.EmpProject_t.Add(pro);
                        }
                        db.SaveChanges();
                    }

                }
                Session["EmpProjectId"] = EmpProjectId;

                {
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
                        appraisals.EmpProjects = Session["EmpProjectId"] as String;
                        //appraisals.EmpSkills = Empskills;
                        //appraisals.SelfOverall = SelfAssessment0.SelectedValue;
                        //appraisals.AssessorOverAll = AssessorRating0.SelectedValue;
                        //appraisals.FinalOverAll = FinalizedRating.SelectedValue;
                        //appraisals.RecPromotion = RecommendedforPromotion0.Text;
                        //appraisals.NotPromoting = notpromoting0.Text;
                        if (appraisals.DoAssessment == null)
                            appraisals.DoAssessment = DateTime.Parse("1753-01-01 00:00:00");
                        if (appraisals.DoAssessmentDisc == null)
                            appraisals.DoAssessmentDisc = DateTime.Parse("1753-01-01 00:00:00");
                        if (appraisals.DoAssessorCompletion == null)
                            appraisals.DoAssessorCompletion = DateTime.Parse("1753-01-01 00:00:00");
                        if (appraisals.DoFinalization == null)
                            appraisals.DoFinalization = DateTime.Parse("1753-01-01 00:00:00");
                        appraisals.Understanding = Session["Understanding"] as String;
                        appraisals.Responsibility = Session["Responsibility"] as String;
                        appraisals.From = Convert.ToDateTime(Session["From"] as String);
                        appraisals.To = Convert.ToDateTime(Session["To"] as String);
                        appraisals.SkillRevRating = ReviewerRating.SelectedValue;
                        appraisals.SkillRevComment = ReviewerComment.Text;
                        appraisals.ProAppOtherCmnt = OtherTextBox.Text;
                        if (appraisal == null)
                            db1.Appraisal_t.Add(appraisals);
                        db1.SaveChanges();
                        Session["appraisal"] = appraisals;
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "Save";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

       
        protected void btnNext_Click(object sender, EventArgs e)
        {
            try
            {  //Save();
                Response.Redirect("~/PerformanceAppraisal2.aspx?=" + type.ToString(),false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "btnNext_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
          }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
                Session["isSaved"] = 1;
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "btnSubmit_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
          }

        protected void btnClose_Click(object sender, EventArgs e)
        {
            try
            {  //Save();
                Response.Redirect("~/PerformanceAppraisal2.aspx?type=" + type.ToString(),false);
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "btnClose_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
          }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
                Session["isSaved"] = 1;
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "btnSave_Click";
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
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "logout_Click";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
            }

        protected void ProjectGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try
            {
                if (e.Row.RowType == DataControlRowType.DataRow)
                {
                    DropDownList combo1 = (DropDownList)e.Row.FindControl("SelfRating");
                    DropDownList combo2 = (DropDownList)e.Row.FindControl("AppraiserRating");
                    
                    TextBox text1 = (TextBox)e.Row.FindControl("SelfComment");
                    TextBox text2 = (TextBox)e.Row.FindControl("AppraiserComment");
                    
                    if (type == 0)
                    {
                        //combo2.Enabled = false;
                        text2.Enabled = false;
                    }
                    else if (type == 1)
                    {
                        combo1.Enabled = false;
                        text1.Enabled = false;
                    }
                    else if (type == 2)
                    {
                        combo1.Enabled = false;
                        combo2.Enabled = false;
                        text1.Enabled = false;
                        text2.Enabled = false;
                    }
                }
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "ProjectGrid_RowDataBound";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }

        protected void ProjectGrid_RowCreated(object sender, GridViewRowEventArgs e)
        {

            try
            {
                
                if (e.Row.RowType == DataControlRowType.DataRow)
                {

                    DropDownList combo1 = (DropDownList)e.Row.FindControl("SelfRating");
                    combo1.DataSource = RatingItem;
                    combo1.DataBind();
                    DropDownList combo2 = (DropDownList)e.Row.FindControl("AppraiserRating");
                    combo2.DataSource = RatingItem;
                    combo2.DataBind();
                }
               
            }
            catch (Exception ex)
            {
                using (PerformanceAppEntities db = new PerformanceAppEntities())
                {
                    Log_t log = new Log_t();
                    log.Error_Message = ex.Message;
                    
                    log.Page = "PerformanceAppraisal3";
                    log.Method = "ProjectGrid_RowCreated";
                    log.Datetime = DateTime.Now;
                    db.Log_t.Add(log);
                    db.SaveChanges();
                    Response.Redirect("~/Login.aspx",false);
                }

            }
        }
    }


}