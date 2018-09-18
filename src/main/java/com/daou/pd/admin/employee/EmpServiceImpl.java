package com.daou.pd.admin.employee;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

@Component("EmpService")

public class EmpServiceImpl implements EmpService {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	private EmpMapper empMapper;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	@Override
	public int selectUser(EmpVO evo) {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.selectAdmin(evo);
	}

	@Override
	public int selectAdmin(EmpVO evo) {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.selectAdmin(evo);
	}

	@Override
	public List<HashMap<String, Object>> memberList() {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.memberList();
	}

	@Override
	public void insertMember(EmpVO evo) throws Exception {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		empMapper.insertMember(evo);
	}

	@Override
	public void deleteMember(String str) {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		empMapper.deleteMember(str);
	}

	@Override
	public EmpVO memberView(EmpVO evo) {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.memberView(evo);
	}

	@Override
	public HashMap<String,Object> memberViewAll(String emp_id) {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.memberViewAll(emp_id);
	}
	
	@Override
	public List<EmpVO> deptList() {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.deptList();
	}
	
	@Override
	public List<EmpVO> gradeList() {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.gradeList();
	}

	@Override
	public void updateMember(EmpVO evo) throws Exception {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		empMapper.updateMember(evo);
	}

	@Override
	public int employeeIdCheck(EmpVO evo) {
		empMapper = sqlSession.getMapper(EmpMapper.class);
		return empMapper.employeeIdCheck(evo);
	}

}
