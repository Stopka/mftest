<?php
/**
 * Created by IntelliJ IDEA.
 * User: stopka
 * Date: 27.3.19
 * Time: 22:11
 */

namespace Stopka\MediaFactory\Model\Database\Entities\Properties;


use Doctrine\ORM\Mapping as ORM;
use Stopka\MediaFactory\Model\Database\Entities\MultilanguageString;

trait TTitleProperty
{
    /**
     * @var MultilanguageString
     * @ORM\OneToOne(targetEntity="MultilanguageString", cascade={"all"}, orphanRemoval=true)
     */
    protected $title;

    /**
     * @return MultilanguageString
     */
    public function getTitle(): MultilanguageString
    {
        return $this->title;
    }

    public function __construct()
    {
        $this->title = new MultilanguageString();
    }


}
