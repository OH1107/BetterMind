package com.ssafy.db.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.ssafy.db.entity.Program;
import com.ssafy.db.entity.User_Program;

@Repository
public interface ProgramRepository extends JpaRepository<Program, Long> {
//	Program findByProgram_id(Long program_id);
}
