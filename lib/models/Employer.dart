class Employer {
  final String? EmployerID;
  final String? EmployerNo;
  final String? AccountID;
  final String? CompanyName;
  final String? Website;
  final String? Email;
  final String? Facebook;
  final String? PhoneNumber;
  final String? Address;
  final String? StateID;
  final String? TownshipID;
  final String? IndustryID;
  final String? ProfileType;
  final String? NoOfEmployee;
  final String? AvgJobperMonth;
  final String? UploadCompanyLogo;
  final String? UploadCompanyCoverphoto;
  final String? CompanyVisionandMission;
  final bool? Active;
  final String? CreatedBy;
  final String? CreatedOn;
  final String? ModifiedBy;
  final String? ModifiedOn;
  final String? LastAction;
  final String? IndustryName;
  final String? StateName;
  final String? TownshipName;
  final String? AccountNo;
  final String? CreatedByCode;
  final String? ModifiedByCode;
  final String? LocationLat;
  final String? LocationLong;
  final String? AboutCompany;
  final String? WhatWeDo;
  final String? Founded;
  final String? ViewCount;
  final String? LastLogin;

  Employer(
      {required this.EmployerID,
      required this.EmployerNo,
      required this.AccountID,
      required this.CompanyName,
      required this.Website,
      required this.Email,
      required this.Facebook,
      required this.PhoneNumber,
      required this.Address,
      required this.StateID,
      required this.TownshipID,
      required this.IndustryID,
      required this.ProfileType,
      required this.NoOfEmployee,
      required this.AvgJobperMonth,
      required this.UploadCompanyLogo,
      required this.UploadCompanyCoverphoto,
      required this.CompanyVisionandMission,
      required this.Active,
      required this.CreatedBy,
      required this.CreatedOn,
      required this.ModifiedBy,
      required this.ModifiedOn,
      required this.LastAction,
      required this.IndustryName,
      required this.StateName,
      required this.TownshipName,
      required this.AccountNo,
      required this.CreatedByCode,
      required this.ModifiedByCode,
      required this.LocationLat,
      required this.LocationLong,
      required this.AboutCompany,
      required this.WhatWeDo,
      required this.Founded,
      required this.ViewCount,
      required this.LastLogin});

  factory Employer.fromJSON(Map<String, dynamic> json) {
    return Employer(
        EmployerID: json['EmployerID'],
        EmployerNo: json['EmployerNo'],
        AccountID: json['AccountID'],
        CompanyName: json['CompanyName'],
        Website: json['Website'],
        Email: json['Email'],
        Facebook: json['Facebook'],
        PhoneNumber: json['PhoneNumber'],
        Address: json['Address'],
        StateID: json['StateID'],
        TownshipID: json['TownshipID'],
        IndustryID: json['IndustryID'],
        ProfileType: json['ProfileType'],
        NoOfEmployee: json['NoOfEmployee'],
        AvgJobperMonth: json['AvgJobperMonth'],
        UploadCompanyLogo: json['UploadCompanyLogo'],
        UploadCompanyCoverphoto: json['UploadCompanyCoverphoto'],
        CompanyVisionandMission: json['CompanyVisionandMission'],
        Active: json['Active'],
        CreatedBy: json['CreatedBy'],
        CreatedOn: json['CreatedOn'],
        ModifiedBy: json['ModifiedBy'],
        ModifiedOn: json['ModifiedOn'],
        LastAction: json['LastAction'],
        IndustryName: json['IndustryName'],
        StateName: json['StateName'],
        TownshipName: json['TownshipName'],
        AccountNo: json['AccountNo'],
        CreatedByCode: json['CreatedByCode'],
        ModifiedByCode: json['ModifiedByCode'],
        LocationLat: json['LocationLat'],
        LocationLong: json['LocationLong'],
        AboutCompany: json['AboutCompany'],
        WhatWeDo: json['WhatWeDo'],
        Founded: json['Founded'],
        ViewCount: json['ViewCount'],
        LastLogin: json['LastLogin']);
  }
}
