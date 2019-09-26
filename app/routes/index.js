import { Router } from 'express';
import helloController from '../controllers/helloController';

const router = Router();

router.get('/hello', helloController.index);
router.get('/login', helloController.login);
router.get('/logout', helloController.login);

export default router;
