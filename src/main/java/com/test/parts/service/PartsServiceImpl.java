package com.test.parts.service;

import com.test.parts.dao.PartsDao;
import com.test.parts.model.Parts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class PartsServiceImpl implements PartsService {

   @Autowired
   private PartsDao partsDao;

   @Transactional
   public void save(Parts part) {
      partsDao.save(part);
   }

   @Transactional
   public List<Parts> getAllFromParts() {
      return partsDao.getAllFromParts();
   }

   @Transactional
   public List<Parts> getAllFromPartsLimited(int pageNumber) {
      return partsDao.getAllFromPartsLimited(pageNumber);
   }

   @Transactional
   public List<Parts> getPartsByFilter(String filter) {
      return partsDao.getPartsByFilter(filter);
   }

   @Transactional
   public List<Parts> getSearchingParts(String text) {
      return partsDao.getSearchingParts(text);
   }

   @Transactional
   public int countAllParts() {
      return partsDao.countAllParts();
   }

   @Transactional
   public Parts getPartById(Integer partId) {
      return partsDao.getPartById(partId);
   }

   @Transactional
   public void updatePart(Parts part) {
      partsDao.updatePart(part);
   }

   @Transactional
   public void deletePart(Integer partId) {
      partsDao.deletePart(partId);
   }

   @Override
   public int countPossibleComputers(List<Parts> parts) {
      return partsDao.countPossibleComputers(parts);
   }

}
