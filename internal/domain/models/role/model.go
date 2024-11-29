package role

// Request model for sending request to Storage.
type Request struct {
	RoleType string `form:"role-type" json:"roleType"`
}

// Response model is receiver model.DB model.
type Response struct {
	RoleType string `db:"role_type"`
}

func (r *Request) ToStorage() Response {
	return Response{RoleType: r.RoleType}
}

// AllRole model is DTO model.
type AllRole struct {
	ID       int    `json:"roleID"`
	RoleType string `json:"roleType"`
}

// AllRoleData model is DAO model.DB.model.
type AllRoleData struct {
	ID       int    `db:"id"`
	RoleType string `db:"role_type"`
}

func (r *AllRoleData) ToServer() *AllRole {
	return &AllRole{ID: r.ID, RoleType: r.RoleType}
}
