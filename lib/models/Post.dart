class Post {
  final String? JobID;

  final String? JobNo;

  final String? EmployerID;

  final String? Title;

  final String? PositionID;

  final String? JobCategoryID;

  final String? JobCategoryName;

  final String? IndustryID;

  final String? WorkingStateID;

  final String? WorkingTownshipID;

  final String? Status;

  final String? ExpiredOn;

  final String? EmploymentType;

  final String? SalaryRange;

  final String? SalaryType;

  final bool? Active;
  final String? CreatedBy;

  final String? CreatedOn;

  final String? ModifiedBy;

  final String? ModifiedOn;

  final String? LastAction;

  final String? JobScope;

  final String? EducationRequirement;

  final String? ExperiencedLevel;

  final String? AdditionalQuestionsAnswer;

  final String? CoverLetter;

  final String? EmployerNo;

  final String? CompanyName;

  final String? Website;

  final String? Email;

  final String? Facebook;

  final String? PhoneNumber;

  final String? Address;

  final String? PositionName;

  final String? IndustryName;

  final String? StateName;

  final String? TownshipName;

  final String? CreatedByCode;

  final String? ModifiedByCode;

  final String? UploadCompanyLogo;

  final String? UploadCompanyCoverphoto;

  final String? AccountID;

  final String? ViewCount;

  final String? ApplicantCounts;

  final String? Workaddress;

  final String? Gender;

  final String? Benefits;

  final String? CareerOpportunities;

  final String? Highlights;

  final String? RecruiterActive;

  final String? PostTime;
  final String? EmploymentTypeHighLightColor;

  Post(
      {required this.JobID,
      required this.JobNo,
      required this.EmployerID,
      required this.Title,
      required this.PositionID,
      required this.JobCategoryID,
      required this.JobCategoryName,
      required this.IndustryID,
      required this.WorkingStateID,
      required this.WorkingTownshipID,
      required this.Status,
      required this.ExpiredOn,
      required this.EmploymentType,
      required this.SalaryRange,
      required this.SalaryType,
      required this.Active,
      required this.CreatedBy,
      required this.CreatedOn,
      required this.ModifiedBy,
      required this.ModifiedOn,
      required this.LastAction,
      required this.JobScope,
      required this.EducationRequirement,
      required this.ExperiencedLevel,
      required this.AdditionalQuestionsAnswer,
      required this.CoverLetter,
      required this.EmployerNo,
      required this.CompanyName,
      required this.Website,
      required this.Email,
      required this.Facebook,
      required this.PhoneNumber,
      required this.Address,
      required this.PositionName,
      required this.IndustryName,
      required this.StateName,
      required this.TownshipName,
      required this.CreatedByCode,
      required this.ModifiedByCode,
      required this.UploadCompanyLogo,
      required this.UploadCompanyCoverphoto,
      required this.AccountID,
      required this.ViewCount,
      required this.ApplicantCounts,
      required this.Workaddress,
      required this.Gender,
      required this.Benefits,
      required this.CareerOpportunities,
      required this.Highlights,
      required this.RecruiterActive,
      required this.PostTime,
      required this.EmploymentTypeHighLightColor});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
        JobID: json['JobID'],
        JobNo: json['JobNo'],
        EmployerID: json['EmployerID'],
        Title: json['Title'],
        PositionID: json['PositionID'],
        JobCategoryID: json['JobCategoryID'],
        JobCategoryName: json['JobCategoryName'],
        IndustryID: json['IndustryID'],
        WorkingStateID: json['WorkingStateID'],
        WorkingTownshipID: json['WorkingTownshipID'],
        Status: json['Status'],
        ExpiredOn: json['ExpiredOn'],
        EmploymentType: json['EmploymentType'],
        SalaryRange: json['SalaryRange'],
        SalaryType: json['SalaryType'],
        Active: json['Active'],
        CreatedBy: json['CreatedBy'],
        CreatedOn: json['CreatedOn'],
        ModifiedBy: json['ModifiedBy'],
        ModifiedOn: json['ModifiedOn'],
        LastAction: json['LastAction'],
        JobScope: json['JobScope'],
        EducationRequirement: json['EducationRequirement'],
        ExperiencedLevel: json['ExperiencedLevel'],
        AdditionalQuestionsAnswer: json['AdditionalQuestionsAnswer'],
        CoverLetter: json['CoverLetter'],
        EmployerNo: json['EmployerNo'],
        CompanyName: json['CompanyName'],
        Website: json['Website'],
        Email: json['Email'],
        Facebook: json['Facebook'],
        PhoneNumber: json['PhoneNumber'],
        Address: json['Address'],
        PositionName: json['PositionName'],
        IndustryName: json['IndustryName'],
        StateName: json['StateName'],
        TownshipName: json['TownshipName'],
        CreatedByCode: json['CreatedByCode'],
        ModifiedByCode: json['ModifiedByCode'],
        UploadCompanyLogo: json['UploadCompanyLogo'],
        UploadCompanyCoverphoto: json['UploadCompanyCoverphoto'],
        AccountID: json['AccountID'],
        ViewCount: json['ViewCount'],
        ApplicantCounts: json['ApplicantCounts'],
        Workaddress: json['Workaddress'],
        Gender: json['Gender'],
        Benefits: json['Benefits'],
        CareerOpportunities: json['CareerOpportunities'],
        Highlights: json['Highlights'],
        RecruiterActive: json['RecruiterActive'],
        PostTime: json['PostTime'],
        EmploymentTypeHighLightColor: json['EmploymentTypeHighLightColor']);
  }
}

class SavePost {
  final String EmployeeName;
  final String EmployeeID;
  final String EmployerID;
  final String CvActive;
  final String CompanyName;
  final String Title;
  final String ExpiredOn;
  final String SalaryRange;
  final String uploadPhoto;
  final String UploadCompanyLogo;
  final String AccountID;
  final String uploadFileName;
  final String uploadResume;
  final String SavedJobNo;
  final String JobID;
  final String SaveOn;
  final String Result;
  final String CVID;
  final String Active;
  final String SavedJobID;
  final String PositionName;
  final String EmploymentType;
  final String EmploymentTypeHighLightColor;
  final String totalRecord;

  SavePost(
      {required this.EmployeeName,
      required this.EmployeeID,
      required this.EmployerID,
      required this.CvActive,
      required this.CompanyName,
      required this.Title,
      required this.ExpiredOn,
      required this.SalaryRange,
      required this.uploadPhoto,
      required this.UploadCompanyLogo,
      required this.AccountID,
      required this.uploadFileName,
      required this.uploadResume,
      required this.SavedJobNo,
      required this.JobID,
      required this.SaveOn,
      required this.Result,
      required this.CVID,
      required this.Active,
      required this.SavedJobID,
      required this.PositionName,
      required this.EmploymentType,
      required this.EmploymentTypeHighLightColor,
      required this.totalRecord});
}

class AppliedPost {
  final String ApplicantID;
  final String JobID;
  final String EmployeeID;
  final String Title;
  final String ApplyOn;
  final String ExpiredOn;
  final String EmployeeName;
  final String UploadPhoto;
  final String SalaryRange;
  final String uplodResume;
  final String CompanyUploadPhoto;
  final String PositionName;
  final String UploadCompanyLogo;
  final String CompanyName;
  final String EmploymentType;
  final String EmploymentTypeHighLightColor;

  AppliedPost(
      {required this.ApplicantID,
      required this.JobID,
      required this.EmployeeID,
      required this.Title,
      required this.ApplyOn,
      required this.ExpiredOn,
      required this.EmployeeName,
      required this.UploadPhoto,
      required this.SalaryRange,
      required this.uplodResume,
      required this.CompanyUploadPhoto,
      required this.PositionName,
      required this.UploadCompanyLogo,
      required this.CompanyName,
      required this.EmploymentType,
      required this.EmploymentTypeHighLightColor});
}

class PostListWithPignation {
  final String totalRecord;
  final String totalPage;
  final String currentPageNo;
  final List<Post> postList;

  PostListWithPignation(
      {required this.totalRecord,
      required this.totalPage,
      required this.currentPageNo,
      required this.postList});

  factory PostListWithPignation.fromJSON(Map<String, dynamic> json) {
    return PostListWithPignation(
        totalPage: json['totalPage'],
        totalRecord: json['totalRecord'],
        currentPageNo: json['currentPageNo'],
        postList: json['postList']);
  }
}
